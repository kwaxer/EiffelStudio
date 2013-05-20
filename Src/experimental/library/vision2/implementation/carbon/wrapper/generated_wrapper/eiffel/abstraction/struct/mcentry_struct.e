-- This file has been generated by EWG. Do not edit. Changes will be lost!

class MCENTRY_STRUCT

inherit

	EWG_STRUCT

	MCENTRY_STRUCT_EXTERNAL
		export
			{NONE} all
		end

create

	make_new_unshared,
	make_new_shared,
	make_unshared,
	make_shared

feature {ANY} -- Access

	sizeof: INTEGER is
		do
			Result := sizeof_external
		end

feature {ANY} -- Member Access

	mctid: INTEGER is
			-- Access member `mctID'
		require
			exists: exists
		do
			Result := get_mctid_external (item)
		ensure
			result_correct: Result = get_mctid_external (item)
		end

	set_mctid (a_value: INTEGER) is
			-- Set member `mctID'
		require
			exists: exists
		do
			set_mctid_external (item, a_value)
		ensure
			a_value_set: a_value = mctid
		end

	mctitem: INTEGER is
			-- Access member `mctItem'
		require
			exists: exists
		do
			Result := get_mctitem_external (item)
		ensure
			result_correct: Result = get_mctitem_external (item)
		end

	set_mctitem (a_value: INTEGER) is
			-- Set member `mctItem'
		require
			exists: exists
		do
			set_mctitem_external (item, a_value)
		ensure
			a_value_set: a_value = mctitem
		end

	mctrgb1: POINTER is
			-- Access member `mctRGB1'
		require
			exists: exists
		do
			Result := get_mctrgb1_external (item)
		ensure
			result_correct: Result = get_mctrgb1_external (item)
		end

	set_mctrgb1 (a_value: POINTER) is
			-- Set member `mctRGB1'
		require
			exists: exists
		do
			set_mctrgb1_external (item, a_value)
		end

	mctrgb2: POINTER is
			-- Access member `mctRGB2'
		require
			exists: exists
		do
			Result := get_mctrgb2_external (item)
		ensure
			result_correct: Result = get_mctrgb2_external (item)
		end

	set_mctrgb2 (a_value: POINTER) is
			-- Set member `mctRGB2'
		require
			exists: exists
		do
			set_mctrgb2_external (item, a_value)
		end

	mctrgb3: POINTER is
			-- Access member `mctRGB3'
		require
			exists: exists
		do
			Result := get_mctrgb3_external (item)
		ensure
			result_correct: Result = get_mctrgb3_external (item)
		end

	set_mctrgb3 (a_value: POINTER) is
			-- Set member `mctRGB3'
		require
			exists: exists
		do
			set_mctrgb3_external (item, a_value)
		end

	mctrgb4: POINTER is
			-- Access member `mctRGB4'
		require
			exists: exists
		do
			Result := get_mctrgb4_external (item)
		ensure
			result_correct: Result = get_mctrgb4_external (item)
		end

	set_mctrgb4 (a_value: POINTER) is
			-- Set member `mctRGB4'
		require
			exists: exists
		do
			set_mctrgb4_external (item, a_value)
		end

	mctreserved: INTEGER is
			-- Access member `mctReserved'
		require
			exists: exists
		do
			Result := get_mctreserved_external (item)
		ensure
			result_correct: Result = get_mctreserved_external (item)
		end

	set_mctreserved (a_value: INTEGER) is
			-- Set member `mctReserved'
		require
			exists: exists
		do
			set_mctreserved_external (item, a_value)
		ensure
			a_value_set: a_value = mctreserved
		end

end