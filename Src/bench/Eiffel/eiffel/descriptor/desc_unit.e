indexing
	description: "Descriptor unit: block in class type descriptor corresponding to%
		%given parent class."
	date: "$Date$"
	revision: "$Revision$"

class DESC_UNIT

inherit
	TO_SPECIAL [ENTRY]

	COMPILER_EXPORTER

	SHARED_COUNTER

create
	make

feature {NONE} -- Creation

	make (c_id: INTEGER; sz: INTEGER) is
		do
			class_id := c_id
			make_area (sz)
			count := sz
		end

feature -- Status report

	count: INTEGER
			-- Number of elements in Current.
		
feature {NONE} -- Access

	class_id: INTEGER

feature -- Generation

	generate (buffer: GENERATION_BUFFER; cnt : COUNTER; id_string: STRING) is
			-- C code of Current descriptor unit
			--|Note1: Currently the feature type is written for all the 
			--|features when in practice it is used rather seldom. Try
			--|to find a better representation (without affecting the
			--|incrementality).
			--|Note2: The offset of an attribute is coded on 16 bits
			--|which might not be enough.
		require
			buffer_not_void: buffer /= Void
			valid_counter: cnt /= Void
		local
			i,j: INTEGER
			l_count: INTEGER
			re: ROUT_ENTRY
			ae: ATTR_ENTRY
			entry_item: ENTRY
			body_index_type, int16, gen_type, separator, null_init: STRING
			invalid_entry: STRING
		do
			from
				body_index_type := "%N%T{(BODY_INDEX) "
				int16 := ", (int16) "
				gen_type := ", gen_type"
				separator := "}, "
				null_init := ", (int16 *) 0"
				Invalid_entry := ", (int16) -1, (int16 *) 0},"
				l_count := count - 1
			until
				i > l_count
			loop
				entry_item := item (i)
				if entry_item /= Void then
					re ?= entry_item
					if re /= Void then
							-- The entry corresponds to a routine.
							-- Write the body index of the routine (index
							-- into the run-time dispatch table) and the type
							-- of the feature.
						buffer.put_string (body_index_type)
						buffer.put_real_body_index (re.real_body_index)
						buffer.put_string (int16)
						buffer.put_static_type_id (re.static_feature_type_id)
					else
						ae ?= entry_item
						check
							ae_not_void: ae /= Void
						end
							-- The entry corresponds to an attribute.
							-- Write the offset of the attribute in the 
							-- run-time structure (object) and the type of
							-- the feature.
						buffer.put_string (body_index_type)
						buffer.put_integer (ae.workbench_offset)
						buffer.put_string (int16)
						buffer.put_static_type_id (ae.static_feature_type_id)
					end

					if entry_item.is_generic then
						buffer.put_string (gen_type)
						buffer.put_integer (cnt.value)
						buffer.put_string (id_string)
						j := cnt.next
					else           
						buffer.put_string (null_init)
					end

					buffer.put_string (separator)

				else
						-- The entry corresponds to a routine that
						-- is not polymorphic.
					buffer.put_string (body_index_type)
					buffer.put_integer (Invalid_index)
					buffer.put_string (invalid_entry)
				end
				i := i + 1
			end
		end

	generate_precomp (buffer: GENERATION_BUFFER; start: INTEGER; cnt : COUNTER; id_string: STRING) is
			-- C code of Current precompiled descriptor unit
			--|Note1: Currently the feature type is written for all the 
			--|features when in practice it is used rather seldom. Try
			--|to find a better representation (without affecting the
			--|incrementality).
			--|Note2: The offset of an attribute is coded on 16 bits
			--|which might not be enough.
		require
			buffer_not_void: buffer /= Void
			valid_counter: cnt /= Void
		local
			i,j: INTEGER
			l_count: INTEGER
			re: ROUT_ENTRY
			ae: ATTR_ENTRY
			nb: INTEGER
			entry_item: ENTRY
			info, desc1, desc2, gen_type, type: STRING
			non_generic, gen_type_string, end_of_line: STRING
		do
			from
					-- Initialize all the constant string used during this generation
				info := "].info = (BODY_INDEX) ("
				desc1 := "%Tdesc" + id_string + "["
				desc2 := ");%N%Tdesc" + id_string + "["
				type := "].type = (int16) ("
				gen_type := "].gen_type = "
				non_generic := "(int16 *) 0;%N"
				gen_type_string := " gen_type"
				end_of_line := ";%N"
				l_count := count - 1
			until
				i > l_count
			loop
				nb := i + start
				entry_item := item (i)
				if entry_item /= Void then
					re ?= entry_item
					if re /= Void then
							-- The entry corresponds to a routine.
							-- Write the body index of the routine (index
							-- into the run-time dispatch table) and the type
							-- of the feature.
						buffer.put_string (desc1)
						buffer.put_integer (nb)
						buffer.put_string (info)
						buffer.put_real_body_index (re.real_body_index)
						buffer.put_string (desc2)
						buffer.put_integer (nb)
						buffer.put_string (type)
						re.generated_static_feature_type_id (buffer)
						buffer.put_string (desc2)
						buffer.put_integer (nb)
						buffer.put_string (gen_type)
					else
						ae ?= entry_item
						check
							ae_not_void: ae /= Void
						end
							-- The entry corresponds to an attribute.
							-- Write the offset of the attribute in the 
							-- run-time structure (object) and the type of
							-- the feature.
						buffer.put_string (desc1)
						buffer.put_integer (nb)
						buffer.put_string (info)
						buffer.put_integer (ae.workbench_offset)
						buffer.put_string (desc2)
						buffer.put_integer (nb)
						buffer.put_string (type)
						ae.generated_static_feature_type_id (buffer)
						buffer.put_string (desc2)
						buffer.put_integer (nb)
						buffer.put_string (gen_type)
					end

					if entry_item.is_generic then
						buffer.put_string (gen_type_string)
						buffer.put_integer (cnt.value)
						buffer.put_string (id_string)
						buffer.put_string (end_of_line)
						j := cnt.next
					else
						buffer.put_string (non_generic)
					end

				else
						-- The entry corresponds to a routine that
						-- is not polymorphic.
					buffer.put_string (desc1)
					buffer.put_integer (nb)
					buffer.put_string (info)
					buffer.put_integer (Invalid_index)
					buffer.put_string (desc2)
					buffer.put_integer (nb)
					buffer.put_string (type)
					buffer.put_integer (-1)
					buffer.put_string (desc2)
					buffer.put_integer (nb)
					buffer.put_string (gen_type)
					buffer.put_string (non_generic)
				end
				i := i + 1
			end
		end

	generate_generic (buffer: GENERATION_BUFFER; cnt : COUNTER; id_string: STRING) is
			-- C code for generic types in Current descriptor unit
		require
			buffer_not_void: buffer /= Void
			valid_counter : cnt /= Void
		local
			i, j: INTEGER
			l_count: INTEGER
			entry_item: ENTRY
			static_decl, start_decl, end_decl: STRING
		do
			from
				static_decl := "static int16 gen_type"
				start_decl := " [] = {0, "
				end_decl := "-1};%N"
				l_count := count - 1
			until
				i > l_count
			loop
				entry_item := item (i)
				if entry_item /= Void and then entry_item.is_generic then
					buffer.put_string (static_decl)
					buffer.put_integer (cnt.value)
					buffer.put_string (id_string)
					j := cnt.next
					buffer.put_string (start_decl)
					entry_item.generate_cid (buffer, False)
					buffer.put_string (end_decl)
				end
				i := i + 1
			end
		end

feature -- Melting

	make_byte_code (ba: BYTE_ARRAY) is
			-- Append byte code of Current descriptor
			-- unit to the `ba' byte array.
			-- Format:
			--    1) Id of origin class (short)
			--    2) Number of elements (short)
			--    3) Sequence of triples (short, short, list_of_short)
		local
			i: INTEGER
			l_count: INTEGER
			re: ROUT_ENTRY
			ae: ATTR_ENTRY
			entry_item: ENTRY
		do
				-- Append the id of the origin class
			ba.append_short_integer (class_id)

			l_count := count

				-- Append the size of the descriptor unit
			ba.append_short_integer (l_count)

				-- Append the descriptor entries
			from
					-- For loop purposes we decreased `l_count'.
				l_count := l_count - 1
			until
				i > l_count
			loop
				entry_item := item (i)
				if entry_item /= Void then
					re ?= entry_item
					if re /= Void then
							-- The entry corresponds to a routine.
							-- Write the body index of the routine (index
							-- into the run-time dispatch table) and the type
							-- of the feature.
						ba.append_uint32_integer (re.real_body_index- 1)
						ba.append_short_integer (re.static_feature_type_id -1)
					else
						ae ?= entry_item
						check
							ae_not_void: ae /= Void
						end
							-- The entry corresponds to an attribute.
							-- Write the offset of the attribute in the 
							-- run-time structure (object) and the type of
							-- the feature.
						ba.append_uint32_integer (ae.workbench_offset)
						ba.append_short_integer (ae.static_feature_type_id - 1)
					end

					if entry_item.is_generic then
						ba.append_short_integer (0)
						entry_item.make_gen_type_byte_code (ba)
					end

					ba.append_short_integer (-1)
				else
						-- The entry corresponds to a routine that
						-- is not polymorphic.
					ba.append_uint32_integer (-1)
					ba.append_short_integer (-1)
					ba.append_short_integer (-1)
				end
				i := i + 1
			end
		end

end -- class DESC_UNIT
