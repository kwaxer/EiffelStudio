﻿note
	description: "A utility class for loading assemblies"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

class
	ASSEMBLY_LOADER

inherit
	MARSHAL_BY_REF_OBJECT
		redefine
			initialize_lifetime_service
		end

	ASSEMBLY_LOADER_IMPL
		export
			{NONE} all
		end

	ISPONSOR
		export
			{NONE} all
		end

feature -- Cleanup

	release_cached_data
			-- Releases all cached data
		local
			l_dom: detachable APP_DOMAIN
			retried: BOOLEAN
		do
			if not retried then
				if attached internal_loaded_assemblies as l_assemblies then
					l_assemblies.wipe_out
				end
				if attached internal_gac_loader as l_gac_loader then
					l_dom := l_gac_loader.my_domain
					if not my_domain.equals (l_dom) and then not l_dom.is_finalizing_for_unload then
							-- Only unload app domain if called from another.
						{APP_DOMAIN}.unload (l_dom)
					end
				end
			end
			internal_loaded_assemblies := Void
			internal_gac_loader := Void
		ensure
			internal_gac_loader_unattached: internal_gac_loader = Void
			internal_loaded_assemblies_unattached: internal_loaded_assemblies = Void
		rescue
			retried := True
			retry
		end

feature {ASSEMBLY_LOADER} -- Access

	my_domain: APP_DOMAIN
			-- Retrieves domain in which loader is running in
		do
			Result := {APP_DOMAIN}.current_domain
			if not attached Result then
				check
					from_documentation: False
				then
				end
			end
		ensure
			result_attached: Result /= Void
		end

feature {NONE} -- Access

	resolver: detachable CONSUMER_AGUMENTED_RESOLVER
			-- Resolver used for load resolution

feature -- Element change

	set_resolver (a_resolver: like resolver)
			-- Sets `resolver' with `a_resolver'
		do
			resolver := a_resolver
		ensure
			resolver_set: resolver = a_resolver
		end

feature -- Basic operations

	load_from (a_path: READABLE_STRING_GENERAL): detachable ASSEMBLY
			-- Attempts to load an assembly from `a_path'
		require
			a_path_attached: a_path /= Void
			not_a_path_is_empty: not a_path.is_empty
			a_path_exists: (create {RAW_FILE}.make_with_name (a_path)).exists
		local
			l_asms: like loaded_assemblies
			retried: BOOLEAN
		do
			if not retried then
				l_asms := loaded_assemblies
				if not l_asms.has (a_path) then
						-- Loads assembly in reflection only mode.
					Result := dotnet_load_from (a_path)
					l_asms.force (Result, a_path)
				else
					Result := l_asms.item (a_path)
				end
			end
		rescue
			retried := True
			retry
		end

	load_from_full_name (a_name: SYSTEM_STRING): detachable ASSEMBLY
			-- Attempts to load an assembly from  a full name `a_name'
		require
			a_name_attached: a_name /= Void
			not_a_name_is_empty: a_name.length > 0
		local
			l_name: ASSEMBLY_NAME
			retried: BOOLEAN
		do
			if not retried then
					-- Loads assembly in reflection only mode.
				create l_name.make
				l_name.set_name (a_name)
				Result := load (l_name)
			end
		rescue
			retried := True
			retry
		end

	load (a_name: ASSEMBLY_NAME): detachable ASSEMBLY
			-- Attempts to load assembly `a_name' and returns the result. If no assembly could be found then
			-- Void will be returned
		require
			a_name_attached: a_name /= Void
		local
			l_asms: like loaded_assemblies
			l_fn: READABLE_STRING_GENERAL
			retried: BOOLEAN
			retried_again: BOOLEAN
		do
			if not retried_again then
				l_asms := loaded_assemblies
				if attached a_name.full_name as l_name then
					if attached l_asms.item (create {STRING_32}.make_from_cil (l_name)) as l_item then
						Result := l_item
					else
						if attached resolver as l_resolver then
								-- Use resolver to find best path possible	
							if attached {APP_DOMAIN}.current_domain as l_domain then
								if attached l_resolver.resolve_by_assembly_name (l_domain, a_name) as l_path then
									l_fn := l_path.name
									Result := load_from (l_fn)
								end
							else
								check
									current_domain_attached: False
								end
							end
						end
						retried := True
						if Result = Void then
								-- Fail safe.
							create {STRING_32} l_fn.make_from_cil (l_name)
							Result := dotnet_load (l_name)
							l_asms.force (Result, l_fn)
						end
					end
				else
					check
						full_name_attached: False
					end
				end
			end
		rescue
			retried_again := retried
			retried := True
			retry
		end

	load_from_gac_or_path (a_path: READABLE_STRING_GENERAL): detachable ASSEMBLY
			-- Attempts to load an assembly `a_path' from the GAC. Failure to find an assembly in the GAC will
			-- load the assembly from the specified path.
		require
			a_path_attached: a_path /= Void
			not_a_path_is_empty: not a_path.is_empty
			a_path_exists: (create {RAW_FILE}.make_with_name (a_path)).exists
		do
			Result := load_from (a_path)
			if Result /= Void then
					-- Attempt to locate in GAC (without a resolver! - do not set active resolver because
					-- the CLR should only resolve in GAC)
				if attached Result.get_name as l_name then
					if attached gac_loader.load (l_name) as a and then a.global_assembly_cache then
						Result := a
					end
				else
					check
						get_name_attached: False
					then
					end
				end
			end
		end

feature -- Domain

	gac_loader: ASSEMBLY_LOADER
			-- Loader used to load GAC only assemblies
		local
			l_obj: SYSTEM_OBJECT
		do
			if attached internal_gac_loader as l_gac_loader then
				Result := l_gac_loader
			else
				l_obj := Current
				if
					attached l_obj.get_type as l_type and then
					attached l_type.assembly as l_ass and then
					attached {APP_DOMAIN}.create_domain (gac_domain_name) as l_new_dom and then
					attached l_new_dom.create_instance_from (l_ass.location, l_type.full_name) as l_hnd and then
					attached {ILEASE} l_hnd.get_lifetime_service as l_lease
				then
						-- Extend life time of created object.
					l_lease.register (Current)
						-- Unwrap.
					if attached {ASSEMBLY_LOADER} l_hnd.unwrap as l_loader then
						internal_gac_loader := l_loader
						Result := l_loader
					else
						check
							from_documentation: False
						then
						end
					end
						-- Add event handler for parent domain unloads.
					l_new_dom.add_domain_unload (Result.new_gac_domain_unload_delelgate)
				else
					check
						from_documentation: False
					then
					end
				end
			end
		ensure
			result_attached: Result /= Void
			internal_gac_loader_set: internal_gac_loader = Result
		end

	on_gac_domain_unloaded (a_sender: detachable SYSTEM_OBJECT; a_args: detachable EVENT_ARGS)
			-- Called when GAC specific domain is being unloaded
		do
			release_cached_data
		end

	internal_gac_loader: detachable like gac_loader
			-- Cached version of `gac_loader'
			-- Note: do not use directly

feature -- Lifetime services

	initialize_lifetime_service: SYSTEM_OBJECT
			-- Obtains a lifetime service object to control the lifetime policy for this instance
		do
			if attached {ILEASE} Precursor {MARSHAL_BY_REF_OBJECT} as l_lease then
				l_lease.initial_lease_time := {TIME_SPAN}.zero
				Result := l_lease
			else
				check
					from_documentation: False
				then
				end
			end
		ensure then
			result_attached: Result /= Void
		end

feature {NONE} -- Lifetime service sponsorship

	renewal (a_lease: detachable ILEASE): TIME_SPAN
			-- Renews lease.
		do
			Result := {TIME_SPAN}.from_days (1)
		ensure then
			result_not_zero: Result /= {TIME_SPAN}.zero
		end

feature {NONE} -- Implementation

	loaded_assemblies: STRING_TABLE [detachable ASSEMBLY]
			-- Table of loaded assemblies
		do
			if attached internal_loaded_assemblies as l_assemblies then
				Result := l_assemblies
			else
				create Result.make_caseless (30)
				internal_loaded_assemblies := Result
			end
		ensure
			result_attached: Result /= Void
			internal_loaded_assemblies_set: internal_loaded_assemblies = Result
		end

	internal_loaded_assemblies: detachable like loaded_assemblies;
			-- Cached version of `loaded_assemblies'
			-- Note: Do not use directly!

feature {ASSEMBLY_LOADER} -- Implementation

	gac_domain_name: SYSTEM_STRING = "ASSEMBLY_LOADER (GAC)"
			-- Friendly name given to GAC domain.

	new_gac_domain_unload_delelgate: EVENT_HANDLER
			-- Creates a new event handler to ensure generated code is verifiable.
		require
			requested_in_gac_domain: attached {APP_DOMAIN}.current_domain as l_domain and then
				attached l_domain.friendly_name as l_name and then l_name.equals (gac_domain_name)
		do
			create Result.make (Current, $on_gac_domain_unloaded)
		ensure
			result_attached: Result /= Void
		end

note
	copyright:	"Copyright (c) 1984-2018, Eiffel Software"
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
			distributed in the hope that it will be useful,	but
			WITHOUT ANY WARRANTY; without even the implied warranty
			of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
			See the	GNU General Public License for more details.
			
			You should have received a copy of the GNU General Public
			License along with Eiffel Software's Eiffel Development
			Environment; if not, write to the Free Software Foundation,
			Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301  USA
		]"
	source: "[
			 Eiffel Software
			 356 Storke Road, Goleta, CA 93117 USA
			 Telephone 805-685-1006, Fax 805-685-6869
			 Website http://www.eiffel.com
			 Customer support http://support.eiffel.com
		]"

end
