note
	description: "Managing information generated by the consumer."
	legal: "See notice at end of class."
	status: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

class
	CONF_CONSUMER_MANAGER

inherit
	CACHE_CONSTANTS
		export
			{NONE} all
		end

	SHARED_CONSUMER_UTILITIES
		export
			{NONE} all
		end

	EXCEPTIONS
		export
			{NONE} all
		end

	CONF_FILE_DATE
		export
			{NONE} all
		end

	CONF_ACCESS

create
	make

feature {NONE} -- Initialization

	make (a_factory: like factory; a_metadata_cache_path: PATH; an_il_version: like il_version; a_application_target: like application_target; an_added_classes, a_removed_classes, a_modified_classes: SEARCH_TABLE [CONF_CLASS])
			-- Create.
		require
			a_factory_ok: a_factory /= Void
			a_metadata_cache_path_ok: a_metadata_cache_path /= Void and then not a_metadata_cache_path.is_empty
			an_il_version_ok: an_il_version /= Void
			a_application_target_ok: a_application_target /= Void
			an_added_classes_ok: an_added_classes /= Void
			a_removed_classes_ok: a_removed_classes /= Void
			a_modified_classes_ok: a_modified_classes /= Void
		do
			factory := a_factory
			metadata_cache_path := a_metadata_cache_path
			il_version := an_il_version
			application_target := a_application_target

			added_classes := an_added_classes
			removed_classes := a_removed_classes
			modified_classes := a_modified_classes
			create consume_assembly_observer
			create linear_assemblies.make (0)
		ensure
			factory_set: factory = a_factory
			metadata_cache_path_set: metadata_cache_path = a_metadata_cache_path
			il_version_set: an_il_version /= Void implies il_version = an_il_version
			application_target_set: application_target = a_application_target
			added_classes_set: added_classes = an_added_classes
			removed_classes_set: removed_classes = a_removed_classes
			modified_classes_set: modified_classes = a_modified_classes
		end

feature -- Status

	is_error: BOOLEAN
			-- Was there an error?
		do
			Result := last_error /= Void
		end

	last_error: CONF_ERROR
			-- Last error.

feature -- Access

	application_target: CONF_TARGET
			-- Application target of the system.

	il_version: STRING_32
			-- IL version to use.

	metadata_cache_path: PATH
			-- Location of the metadata cache.

	full_cache_path: PATH
			-- Final location where the metadata realy is stored.
		do
			Result := metadata_cache_path.extended (short_cache_name).extended (cache_bit_platform).extended (il_version)
		end

	assemblies: STRING_TABLE [CONF_PHYSICAL_ASSEMBLY]
		-- Assemblies in the system after compilation indexed by their UUID.

feature -- Observers

	consume_assembly_observer: ACTION_SEQUENCE [TUPLE]
			-- Observer if assemblies are consumed.

feature -- Commands

	build_assemblies (a_new_assemblies: like new_assemblies; an_old_assemblies: STRING_TABLE [CONF_PHYSICAL_ASSEMBLY_INTERFACE])
			-- Build information about `a_new_assemblies' from the metadata cache and `an_old_assemblies' and store them in `assemblies'.
		require
			a_new_assemblies_not_void: a_new_assemblies /= Void
		local
			l_retried: BOOLEAN
		do
			if not l_retried then
					-- load information from metadata cache, consume if the metadata cache does not yet exist
				retrieve_cache
				if cache_content = Void then
					consume_all_assemblies (a_new_assemblies)
				end
				check
					cache_retrieved: cache_content /= Void
				end

				if an_old_assemblies /= Void then
					old_assemblies := an_old_assemblies
					check_old_assemblies_in_cache
					old_assemblies.linear_representation.do_all (agent {CONF_PHYSICAL_ASSEMBLY}.reset_assemblies)
				else
					create old_assemblies.make (0)
				end
				new_assemblies := a_new_assemblies
				create assemblies.make (old_assemblies.count)
				linear_assemblies.wipe_out

					-- go through all the assemblies and update the information if necessary
				from
					new_assemblies.start
				until
					new_assemblies.after
				loop
						-- build the assembly,
						-- consume if necessary
					build_assembly (new_assemblies.item_for_iteration)

					new_assemblies.forth
				end

					-- build/add dependencies
				from
					linear_assemblies.start
				until
					linear_assemblies.after
				loop
					build_dependencies (linear_assemblies.item)
					linear_assemblies.forth
				end
			end
			if internal_il_emitter.item /= Void then
				il_emitter.unload
			end
		ensure
			assemblies_set: not is_error implies assemblies /= Void
		rescue
			check
				is_error: is_error
			end
			if attached {CONF_EXCEPTION} exception_manager.last_exception.original as lt_ex then
				l_retried := True
				retry
			end
		end

feature {NONE} -- Events

	on_consume_assemblies
			-- Assemblies of are consumed.
		do
			consume_assembly_observer.call (Void)
		end

feature {NONE} -- Implementation

	modified_classes: SEARCH_TABLE [CONF_CLASS]
			-- The list of modified classes.

	added_classes: SEARCH_TABLE [CONF_CLASS]
			-- The list of added classes.

	removed_classes: SEARCH_TABLE [CONF_CLASS]
			-- The list of removed classes.

	linear_assemblies: ARRAYED_LIST [CONF_PHYSICAL_ASSEMBLY]
			-- Linear list of assemblies we have to process.

	factory: CONF_FACTORY
		-- Factory to create new configuration nodes.

	cache_content: CACHE_INFO
		-- Content of the metadata cache.

	old_assemblies: STRING_TABLE [CONF_PHYSICAL_ASSEMBLY_INTERFACE]
		-- Old assemblies from previous compilation.

	new_assemblies: SEARCH_TABLE [CONF_ASSEMBLY]
		-- List of assemblies to process.

	get_physical_assembly (a_consumed: CONSUMED_ASSEMBLY): CONF_PHYSICAL_ASSEMBLY
			-- Get the physical assembly for `a_consumed'.
		require
			a_consumed_ok: a_consumed /= Void
		local
			l_as_i: CONF_PHYSICAL_ASSEMBLY_INTERFACE
			l_guid: READABLE_STRING_32
		do
				-- see if we already have information about this assembly
			l_guid := a_consumed.unique_id
			Result := assemblies.item (l_guid)
			if Result = Void then
					-- see if we have information from a previous compilation
				l_as_i := old_assemblies.item (l_guid)
				if l_as_i /= Void then
					Result ?= l_as_i
					check
						conf_physical_assembly: Result /= Void
					end
				end
				if Result /= Void then
					old_assemblies.remove (l_guid)
					Result.set_target (application_target)
						-- has the assembly been modified?
					if Result.has_date_changed then
							-- update information
						Result.set_consumed_assembly (a_consumed)
						rebuild_classes (Result)
						Result.set_date
					end
				else
						-- create a new physical assembly
					Result := factory.new_physical_assembly (a_consumed, full_cache_path, application_target)
					rebuild_classes (Result)
				end
				assemblies.force (Result, l_guid)
				linear_assemblies.force (Result)
			end
		ensure
			Result_valid: Result /= Void and then Result.is_valid
			Result_computed: Result.classes_set
			Result_date_valid: Result.date > 0
		end

	build_assembly (a_assembly: CONF_ASSEMBLY)
			-- Build information for `a_assembly'.
		require
			a_assembly_ok: a_assembly /= Void and then a_assembly.is_valid
		local
			l_physical_assembly: CONF_PHYSICAL_ASSEMBLY
		do
			l_physical_assembly := get_physical_assembly (consumed_assembly (a_assembly))
			a_assembly.set_physical_assembly (l_physical_assembly)
			l_physical_assembly.set_is_dependency (False)

			set_renamed_classes (a_assembly)
		ensure
			physical_assembly_set: a_assembly.physical_assembly /= Void
			classes_set: a_assembly.classes_set
		end

	set_renamed_classes (a_assembly: CONF_ASSEMBLY)
			-- Set classes on `a_assembly' taking them from the physical assembly and applying renamings if necessary.
		require
			a_assembly_ok: a_assembly /= Void and then a_assembly.is_valid
			a_assembly_physical_assembly_set: a_assembly.physical_assembly /= Void
		local
			l_classes, l_new_classes: STRING_TABLE [CONF_CLASS]
			l_class: CONF_CLASS_ASSEMBLY
			l_renamings: STRING_TABLE [STRING_32]
			l_prefix: STRING_32
			l_name: STRING_32
		do
			l_classes := a_assembly.physical_assembly.classes
			l_renamings := a_assembly.renaming
			l_prefix := a_assembly.name_prefix

				-- Do we have any renamings?
			if
				(l_renamings = Void or else l_renamings.is_empty) and
				(l_prefix = Void or else l_prefix.is_empty)
			then
				a_assembly.set_classes (l_classes)
			else
				from
					create l_new_classes.make (l_classes.count)
					l_classes.start
				until
					l_classes.after
				loop
					l_class ?= l_classes.item_for_iteration
					check
						assembly_class: l_class /= Void
					end
					l_name := l_class.name.twin
					if l_renamings /= Void and then l_renamings.has_key (l_name) then
						l_name := l_renamings.found_item
					end
					if l_prefix /= Void then
						l_name.prepend (l_prefix)
					end
					l_new_classes.force (l_class, l_name)
					l_classes.forth
				end
				a_assembly.set_classes (l_new_classes)
			end
		ensure
			classes_set: a_assembly.classes_set
		end

	build_dependencies (an_assembly: CONF_PHYSICAL_ASSEMBLY)
			-- Build dependencies for `an_assembly'.
		require
			an_assembly_ok: an_assembly /= Void
		local
			l_guid, l_dep_guid: READABLE_STRING_32
			l_reader: EIFFEL_DESERIALIZER
			l_referenced_assemblies_mapping: CONSUMED_ASSEMBLY_MAPPING
			l_referenced_assemblies: ARRAYED_LIST [CONSUMED_ASSEMBLY]
			i, cnt: INTEGER
			l_cons_ass: CONSUMED_ASSEMBLY
		do
			l_guid := an_assembly.guid

				-- we have to get the dependencies from the reference file
			create l_reader
			l_reader.deserialize (an_assembly.consumed_path.extended
				(referenced_assemblies_info_file).name, 0)
			if not l_reader.successful then
				add_error (create {CONF_METADATA_CORRUPT})
			end
			l_referenced_assemblies_mapping ?= l_reader.deserialized_object
			check
				consumed_assembly_mapping: l_referenced_assemblies_mapping /= Void
			end
			l_referenced_assemblies := l_referenced_assemblies_mapping.assemblies
			if l_referenced_assemblies /= Void then
				from
					l_referenced_assemblies.start
					i := 1
					cnt := l_referenced_assemblies.count
				until
					i > cnt
				loop
					l_cons_ass := l_referenced_assemblies.i_th (i)
					l_dep_guid := l_cons_ass.unique_id
						-- if it's not the assembly itself
					if not l_dep_guid.same_string (l_guid) then
						an_assembly.add_dependency (get_physical_assembly (l_cons_ass), i)
					end
					i := i + 1
				end
			end
		end

	rebuild_classes (a_assembly: CONF_PHYSICAL_ASSEMBLY)
			-- (Re)build the list of classes in `a_assembly'.
		require
			a_assembly_ok: a_assembly /= Void
		local
			l_old_dotnet_classes: STRING_TABLE [CONF_CLASS]
			l_reader: EIFFEL_DESERIALIZER
			l_types: CONSUMED_ASSEMBLY_TYPES
			i, cnt: INTEGER
			l_name, l_dotnet_name: STRING
			l_pos: INTEGER
			l_new_classes, l_new_dotnet_classes: STRING_TABLE [CONF_CLASS]
			l_class: CONF_CLASS_ASSEMBLY
		do
			create l_reader

				-- Twin old classes because we will remove reused classes.
			if a_assembly.classes_set then
				l_old_dotnet_classes := a_assembly.dotnet_classes.twin
			else
				create l_old_dotnet_classes.make (0)
			end

				-- Get classes.
			l_reader.deserialize (a_assembly.consumed_path.extended (types_info_file).name, 0)
			if not l_reader.successful then
				add_error (create {CONF_METADATA_CORRUPT})
			end
			l_types ?= l_reader.deserialized_object
			check
				consumed_assembly_types: l_types /= Void
			end
			a_assembly.set_date

				-- Add classes.
			create l_new_classes.make (l_old_dotnet_classes.count)
			create l_new_dotnet_classes.make (l_old_dotnet_classes.count)
			from
				i := l_types.eiffel_names.lower
				cnt := l_types.eiffel_names.upper
				check
					same_dotnet: l_types.dotnet_names.lower = i
					same_dotnet: l_types.dotnet_names.upper = cnt
				end
			until
				i > cnt
			loop
				l_name := l_types.eiffel_names.item (i)
				l_dotnet_name := l_types.dotnet_names.item (i)
				l_pos := l_types.positions.item (i)
				if l_name /= Void and then not l_name.is_empty then
					l_name.to_upper
					l_class ?= l_old_dotnet_classes.item (l_dotnet_name)
					if l_class /= Void then
						l_old_dotnet_classes.remove (l_dotnet_name)
						l_class.set_group (a_assembly)
						l_class.set_type_position (l_pos)
						if l_class.is_compiled then
							modified_classes.force (l_class)
						end
					else
						l_class := factory.new_class_assembly (l_name, l_dotnet_name, a_assembly, l_pos)
						added_classes.force (l_class)
					end
					l_new_classes.force (l_class, l_name)
					l_new_dotnet_classes.force (l_class, l_dotnet_name)
				end
				i := i + 1
			end

				-- Classes in l_old_dotnet_classes are not used any more, mark them as removed.
			if l_old_dotnet_classes /= Void then
				from
					l_old_dotnet_classes.start
				until
					l_old_dotnet_classes.after
				loop
					l_class ?= l_old_dotnet_classes.item_for_iteration
					l_class.invalidate
					if l_class.is_compiled then
						removed_classes.force (l_class)
					end
					l_old_dotnet_classes.forth
				end
			end

			a_assembly.set_classes (l_new_classes)
			a_assembly.set_dotnet_classes (l_new_dotnet_classes)
		ensure
			date_set: a_assembly.date > 0 and then not a_assembly.has_date_changed
		end

feature {CONSUMER_EXPORT} -- Information building

	rebuild_assembly (a_assembly: CONF_PHYSICAL_ASSEMBLY)
			-- (Re)build `a_assembly' that was not fully consumed before but is fully consumed now.
		require
			a_assembly_ok: a_assembly /= Void
		do
				-- this is only called if we fully consume a partially consumed assembly and therefore we always have
				-- a consumed assembly
			retrieve_cache
			a_assembly.set_consumed_assembly (consumed_local_assembly (a_assembly.consumed_assembly.location))
			rebuild_classes (a_assembly)
		ensure
			date_set: a_assembly.date > 0 and then not a_assembly.has_date_changed
		end

feature {NONE} -- retrieving information from cache

	consumed_assembly (an_assembly: CONF_ASSEMBLY): CONSUMED_ASSEMBLY
			-- Retrieve (and consume if necessary) consumed information about `an_assembly'.
		require
			an_assembly_ok: an_assembly /= Void
		local
			l_path: PATH
		do
				-- was this a non local assembly?
			if an_assembly.is_non_local_assembly then
				Result := consumed_gac_assembly (an_assembly)
				if Result = Void then
						-- (re)consume the assembly
					consume_gac_assembly (an_assembly)
					Result := consumed_gac_assembly (an_assembly)
				end
			else
					-- It is a local assembly
				l_path := an_assembly.location.evaluated_path
				Result := consumed_local_assembly (l_path)
				if Result = Void then
					-- (re)consume all local assemblies
					consume_local_assemblies (new_assemblies)
					Result := consumed_local_assembly (l_path)
				end
			end
			if Result = Void or else not Result.is_consumed then
				if an_assembly.is_non_local_assembly then
					add_error (create {CONF_ERROR_ASOP}.make (an_assembly.name, an_assembly.target.system.file_name))
				else
					add_error (create {CONF_ERROR_ASOP}.make (an_assembly.location.original_path, an_assembly.target.system.file_name))
				end
			end
		ensure
			Result_not_void: Result /= Void
		end

	consumed_local_assembly (a_location: PATH): CONSUMED_ASSEMBLY
			-- Retrieve the consumed assembly for a local assembly in `a_location' if we have up to date information in the cache.
		require
			cache_content_set: cache_content /= Void
			a_location_set: a_location /= Void and then not a_location.is_empty
		local
			l_formated_location: PATH
			l_assemblies: ARRAYED_LIST [CONSUMED_ASSEMBLY]
			l_as: CONSUMED_ASSEMBLY
		do
				-- find the assembly in the cache
			l_formated_location := a_location.canonical_path
			from
				l_assemblies := cache_content.assemblies
				l_assemblies.start
			until
				l_assemblies.after
			loop
				l_as := l_assemblies.item
				if l_as.has_same_path (l_formated_location) then
					Result := l_as
					l_assemblies.finish
				end
				l_assemblies.forth
			end

				-- check if the cache information is up to date
			if Result /= Void and then not is_cache_up_to_date (Result) then
				Result := Void
			end
		end

	consumed_gac_assembly (an_assembly: CONF_ASSEMBLY): CONSUMED_ASSEMBLY
			-- Retrieve the consumed assembly for `an_assembly' that is only specified by gac information if we have up to date information in the cache.
		require
			cache_content_set: cache_content /= Void
			an_assembly_ok: an_assembly /= Void and then an_assembly.is_non_local_assembly
		local
			l_name, l_version, l_culture, l_key: READABLE_STRING_32
			l_assemblies: ARRAYED_LIST [CONSUMED_ASSEMBLY]
			l_as: CONSUMED_ASSEMBLY
		do
			l_name := an_assembly.assembly_name
			l_version := an_assembly.assembly_version
			l_culture := an_assembly.assembly_culture
			l_key := an_assembly.assembly_public_key_token
			from
				l_assemblies := cache_content.assemblies
				l_assemblies.start
			until
				Result /= Void or l_assemblies.after
			loop
				l_as := l_assemblies.item
				if l_as.has_same_gac_information (l_name, l_version, l_culture, l_key) then
					Result := l_as
					l_assemblies.finish
				end
				l_assemblies.forth
			end

				-- check if the cache information is up to date
			if not is_cache_up_to_date (Result) then
				Result := Void
			end
		end

feature {NONE} -- Consuming

	consume_all_assemblies  (an_assemblies: SEARCH_TABLE [CONF_ASSEMBLY])
			-- Consume all (local and gac) assemblies in `an_assemblies'.
		require
			an_assemblies_not_void: an_assemblies /= Void
		local
			l_a: CONF_ASSEMBLY
			l_paths: STRING_32
			l_path: READABLE_STRING_GENERAL
			l_unique_paths: STRING_TABLE [BOOLEAN]
			l_emitter: like il_emitter
		do
			create l_unique_paths.make_caseless (10)

			on_consume_assemblies
			l_emitter := il_emitter
			create l_paths.make_empty
			across an_assemblies as l_assembly loop
				l_a := l_assembly.item
				if l_a.is_non_local_assembly then
					l_emitter.consume_assembly (l_a.assembly_name, l_a.assembly_version, l_a.assembly_culture, l_a.assembly_public_key_token, True)
				else
					l_path := l_a.location.evaluated_path.name
					if not l_unique_paths.has (l_path) then
						l_unique_paths.force (True, l_path)
						l_paths.append_string_general (l_path)
						l_paths.append_character (';')
					end
				end
			end
			if not l_paths.is_empty then
				l_paths.remove_tail (1)
				l_emitter.consume_assembly_from_path (l_paths, True, Void)
			end
			retrieve_cache
			if cache_content = Void then
				add_error (create {CONF_METADATA_CORRUPT})
			end
		ensure
			cache_content_set: cache_content /= Void
		end

	consume_local_assemblies (an_assemblies: SEARCH_TABLE [CONF_ASSEMBLY])
			-- Consume all local assemblies in `an_assemblies'.
		require
			an_assemblies_not_void: an_assemblies /= Void
		local
			l_a: CONF_ASSEMBLY
			l_paths: STRING_32
			l_path: READABLE_STRING_GENERAL
			l_unique_paths: STRING_TABLE [BOOLEAN]
			l_emitter: like il_emitter
		do
			create l_unique_paths.make_caseless (10)

			on_consume_assemblies
			create l_paths.make_empty
			across an_assemblies as l_assembly loop
				l_a := l_assembly.item
				if not l_a.is_non_local_assembly then
					l_path := l_a.location.evaluated_path.name
					if not l_unique_paths.has (l_path) then
						l_unique_paths.force (True, l_path)
						l_paths.append_string_general (l_path)
						l_paths.append_character (';')
					end
				end
			end
			if not l_paths.is_empty then
				l_paths.remove_tail (1)
				l_emitter := il_emitter
				l_emitter.consume_assembly_from_path (l_paths, True, Void)
			end
			retrieve_cache
			if cache_content = Void then
				add_error (create {CONF_METADATA_CORRUPT})
			end
		ensure
			cache_content_set: cache_content /= Void
		end

	consume_gac_assembly (an_assembly: CONF_ASSEMBLY)
			-- Consume `an_assembly' which was specified without a location.
		require
			an_assembly_ok: an_assembly /= Void and then an_assembly.is_non_local_assembly
		local
			l_emitter: like il_emitter
		do
			on_consume_assemblies
			l_emitter := il_emitter
			l_emitter.consume_assembly (an_assembly.assembly_name, an_assembly.assembly_version, an_assembly.assembly_culture, an_assembly.assembly_public_key_token, True)
			retrieve_cache
			if cache_content = Void then
				add_error (create {CONF_METADATA_CORRUPT})
			end
		ensure
			cache_content_set: cache_content /= Void
		end

feature {NONE} -- error handling

	add_error (an_error: CONF_ERROR)
			-- Add `an_error' and raise an exception.
		require
			an_error_not_void: an_error /= Void
		local
			l_conf_exception: CONF_EXCEPTION
		do
			last_error := an_error
			create l_conf_exception
			l_conf_exception.set_description (an_error.text)
			l_conf_exception.raise
		end

feature {CONSUMER_EXPORT} -- il emitter

	il_emitter: IL_EMITTER
			-- Instance of IL_EMITTER
		do
			Result := internal_il_emitter.item
			if Result = Void then
				create Result.make (metadata_cache_path, il_version)
				if not Result.exists then
						-- IL_EMITTER component could not be loaded.
					add_error (create {CONF_ERROR_EMITTER})
					Result := Void
				elseif not Result.is_initialized then
						-- Path to cache is not valid
					add_error (create {CONF_ERROR_EMITTER_INIT}.make (Result.last_com_code))
					Result := Void
				else
					internal_il_emitter.put (Result)
				end
			end
		ensure
			valid_result: Result /= Void implies Result.exists and then Result.is_initialized
		end

	internal_il_emitter: CELL [IL_EMITTER]
			-- Unique instance of IL_EMITTER
		once
			create Result.put (Void)
		ensure
			result_not_void: Result /= Void
		end

feature {NONE} -- helpers

	retrieve_cache
			-- Try to retrieve the information from the metadata cache.
		local
			l_reader: EIFFEL_DESERIALIZER
			l_eac_file: PATH
			l_file: RAW_FILE
		do
				-- Reset cached cache content
			cache_content := Void
			l_eac_file := full_cache_path.extended (cache_info_file)
			create l_file.make_with_path (l_eac_file)
			if l_file.exists and then l_file.is_readable then
				create l_reader
				l_reader.deserialize (l_eac_file.name, 0)
				if l_reader.successful then
					cache_content ?= l_reader.deserialized_object
					check
						cache_info: cache_content /= Void
					end
				end
			end
		end

	check_old_assemblies_in_cache
			-- Check if all guids from `old_assemblies' are still in the cache.
		require
			old_assemblies_not_void: old_assemblies /= Void
			cache_content_not_void: cache_content /= Void
		local
			l_assemblies: ARRAYED_LIST [CONSUMED_ASSEMBLY]
			l_guids: SEARCH_TABLE [READABLE_STRING_32]
		do
				-- build list of guids in cache
			from
				l_assemblies := cache_content.assemblies
				create l_guids.make (l_assemblies.count)
				l_assemblies.start
			until
				l_assemblies.after
			loop
				l_guids.force (l_assemblies.item.unique_id)
				l_assemblies.forth
			end

			from
				old_assemblies.start
			until
				old_assemblies.after
			loop
				if not l_guids.has (old_assemblies.item_for_iteration.guid) then
					add_error (create {CONF_METADATA_CORRUPT})
				end
				old_assemblies.forth
			end
		end

	is_cache_up_to_date (an_assembly: CONSUMED_ASSEMBLY): BOOLEAN
			-- Are the cache information for `an_assembly' up to date?
			-- Also set `cache_modified_date',
		require
			an_assembly_not_void: an_assembly /= Void
		local
			l_cache_mod_date, l_mod_date: INTEGER
		do
			if an_assembly.is_consumed then
					-- date of last modification to the assembly
				l_mod_date := file_path_modified_date (an_assembly.location)
				if l_mod_date = -1 then
					l_mod_date := file_path_modified_date (an_assembly.gac_path)
				end
					-- date of the cached information
				l_cache_mod_date := file_path_modified_date (full_cache_path.extended
					(an_assembly.folder_name).extended (types_info_file))

				Result := l_mod_date /= -1 and then l_cache_mod_date > l_mod_date
			end
		end

feature {NONE} -- Contract

	assemblies_valid: BOOLEAN
			-- Are `assemblies' valid?
		do
			Result := True
			if not linear_assemblies.is_empty then
				Result := assemblies /= Void and then assemblies.count = linear_assemblies.count and then
					linear_assemblies.for_all (agent (a_assembly: CONF_PHYSICAL_ASSEMBLY): BOOLEAN
						do
							Result := a_assembly.is_valid and a_assembly.classes_set and assemblies.has_key (a_assembly.guid) and then assemblies.found_item = a_assembly
						end)
			else
				Result := assemblies = Void or else assemblies.is_empty
			end
		end

	old_assemblies_valid: BOOLEAN
			-- Are `old_assemblies' valid?
		do
			Result := True
			if old_assemblies /= Void then
				Result := old_assemblies.linear_representation.for_all (agent (a_assembly: CONF_PHYSICAL_ASSEMBLY_INTERFACE): BOOLEAN
					do
						Result := a_assembly.classes_set
					end)
			end
		end

	new_assemblies_valid: BOOLEAN
			-- Are `new_assemblies' valid?
		do
			Result := True
			if attached new_assemblies as l_assemblies then
				from
					l_assemblies.start
				until
					not Result or l_assemblies.after
				loop
					Result := l_assemblies.item_for_iteration.is_valid
					l_assemblies.forth
				end
			end
		end

invariant
	factory_set: factory /= Void
	il_version_set: il_version /= Void and then not il_version.is_empty
	metadata_cache_path_set: metadata_cache_path /= Void
	linear_assemblies_not_void: linear_assemblies /= Void
	assemblies_valid: assemblies_valid
	old_assemblies_valid: old_assemblies_valid
	new_assemblies_valid: new_assemblies_valid
	added_classes_not_void: added_classes /= Void
	removed_classes_not_void: removed_classes /= Void
	modified_classes_not_void: modified_classes /= Void
	consume_assembly_observer_not_void: consume_assembly_observer /= Void

note
	copyright:	"Copyright (c) 1984-2013, Eiffel Software"
	license:	"GPL version 2 (see http://www.eiffel.com/licensing/gpl.txt)"
	licensing_options:	"http://www.eiffel.com/licensing"
	copying: "[
			This file is part of Eiffel Software's Eiffel Development Environment.
			
			Eiffel Software's Eiffel Development Environment is free
			software; you can redistribute it and/or modify it under
			the terms of the GNU General Public License as published
			by the Free Software Foundation, version 2 of the License
			(available at the URL listed under "license" above).
			
			Eiffel Software's Eiffel Development Environment is
			distributed in the hope that it will be useful, but
			WITHOUT ANY WARRANTY; without even the implied warranty
			of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
			See the GNU General Public License for more details.
			
			You should have received a copy of the GNU General Public
			License along with Eiffel Software's Eiffel Development
			Environment; if not, write to the Free Software Foundation,
			Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
		]"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"
end
