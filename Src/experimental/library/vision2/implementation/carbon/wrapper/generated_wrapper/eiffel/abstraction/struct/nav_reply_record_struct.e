-- This file has been generated by EWG. Do not edit. Changes will be lost!

class NAV_REPLY_RECORD_STRUCT

inherit

	EWG_STRUCT

	NAV_REPLY_RECORD_STRUCT_EXTERNAL
		export
			{NONE} all
		end

create

	make_new_unshared,
	make_new_shared,
	make_unshared,
	make_shared

feature {NONE} -- Implementation

	sizeof: INTEGER is
		do
			Result := sizeof_external
		end

feature {ANY} -- Member Access

	get_version: INTEGER is
		obsolete "Use `version' instead."
			-- Access member `version'
		require
			exists: exists
		do
			Result := get_version_external (item)
		ensure
			result_correct: Result = get_version_external (item)
		end

	version: INTEGER is
			-- Access member `version'
		require
			exists: exists
		do
			Result := get_version_external (item)
		ensure
			result_correct: Result = get_version_external (item)
		end

	set_version (a_value: INTEGER) is
			-- Set member `version'
		require
			exists: exists
		do
			set_version_external (item, a_value)
		ensure
			a_value_set: a_value = version
		end

	get_validrecord: INTEGER is
		obsolete "Use `validrecord' instead."
			-- Access member `validRecord'
		require
			exists: exists
		do
			Result := get_validrecord_external (item)
		ensure
			result_correct: Result = get_validrecord_external (item)
		end

	validrecord: INTEGER is
			-- Access member `validRecord'
		require
			exists: exists
		do
			Result := get_validrecord_external (item)
		ensure
			result_correct: Result = get_validrecord_external (item)
		end

	set_validrecord (a_value: INTEGER) is
			-- Set member `validRecord'
		require
			exists: exists
		do
			set_validrecord_external (item, a_value)
		ensure
			a_value_set: a_value = validrecord
		end

	get_replacing: INTEGER is
		obsolete "Use `replacing' instead."
			-- Access member `replacing'
		require
			exists: exists
		do
			Result := get_replacing_external (item)
		ensure
			result_correct: Result = get_replacing_external (item)
		end

	replacing: INTEGER is
			-- Access member `replacing'
		require
			exists: exists
		do
			Result := get_replacing_external (item)
		ensure
			result_correct: Result = get_replacing_external (item)
		end

	set_replacing (a_value: INTEGER) is
			-- Set member `replacing'
		require
			exists: exists
		do
			set_replacing_external (item, a_value)
		ensure
			a_value_set: a_value = replacing
		end

	get_isstationery: INTEGER is
		obsolete "Use `isstationery' instead."
			-- Access member `isStationery'
		require
			exists: exists
		do
			Result := get_isstationery_external (item)
		ensure
			result_correct: Result = get_isstationery_external (item)
		end

	isstationery: INTEGER is
			-- Access member `isStationery'
		require
			exists: exists
		do
			Result := get_isstationery_external (item)
		ensure
			result_correct: Result = get_isstationery_external (item)
		end

	set_isstationery (a_value: INTEGER) is
			-- Set member `isStationery'
		require
			exists: exists
		do
			set_isstationery_external (item, a_value)
		ensure
			a_value_set: a_value = isstationery
		end

	get_translationneeded: INTEGER is
		obsolete "Use `translationneeded' instead."
			-- Access member `translationNeeded'
		require
			exists: exists
		do
			Result := get_translationneeded_external (item)
		ensure
			result_correct: Result = get_translationneeded_external (item)
		end

	translationneeded: INTEGER is
			-- Access member `translationNeeded'
		require
			exists: exists
		do
			Result := get_translationneeded_external (item)
		ensure
			result_correct: Result = get_translationneeded_external (item)
		end

	set_translationneeded (a_value: INTEGER) is
			-- Set member `translationNeeded'
		require
			exists: exists
		do
			set_translationneeded_external (item, a_value)
		ensure
			a_value_set: a_value = translationneeded
		end

	get_selection: POINTER is
		obsolete "Use `selection' instead."
			-- Access member `selection'
		require
			exists: exists
		do
			Result := get_selection_external (item)
		ensure
			result_correct: Result = get_selection_external (item)
		end

	selection: POINTER is
			-- Access member `selection'
		require
			exists: exists
		do
			Result := get_selection_external (item)
		ensure
			result_correct: Result = get_selection_external (item)
		end

	set_selection (a_value: POINTER) is
			-- Set member `selection'
		require
			exists: exists
		do
			set_selection_external (item, a_value)
		end

	get_keyscript: INTEGER is
		obsolete "Use `keyscript' instead."
			-- Access member `keyScript'
		require
			exists: exists
		do
			Result := get_keyscript_external (item)
		ensure
			result_correct: Result = get_keyscript_external (item)
		end

	keyscript: INTEGER is
			-- Access member `keyScript'
		require
			exists: exists
		do
			Result := get_keyscript_external (item)
		ensure
			result_correct: Result = get_keyscript_external (item)
		end

	set_keyscript (a_value: INTEGER) is
			-- Set member `keyScript'
		require
			exists: exists
		do
			set_keyscript_external (item, a_value)
		ensure
			a_value_set: a_value = keyscript
		end

	get_filetranslation: POINTER is
		obsolete "Use `filetranslation' instead."
			-- Access member `fileTranslation'
		require
			exists: exists
		do
			Result := get_filetranslation_external (item)
		ensure
			result_correct: Result = get_filetranslation_external (item)
		end

	filetranslation: POINTER is
			-- Access member `fileTranslation'
		require
			exists: exists
		do
			Result := get_filetranslation_external (item)
		ensure
			result_correct: Result = get_filetranslation_external (item)
		end

	set_filetranslation (a_value: POINTER) is
			-- Set member `fileTranslation'
		require
			exists: exists
		do
			set_filetranslation_external (item, a_value)
		ensure
			a_value_set: a_value = filetranslation
		end

	get_reserved1: INTEGER is
		obsolete "Use `reserved1' instead."
			-- Access member `reserved1'
		require
			exists: exists
		do
			Result := get_reserved1_external (item)
		ensure
			result_correct: Result = get_reserved1_external (item)
		end

	reserved1: INTEGER is
			-- Access member `reserved1'
		require
			exists: exists
		do
			Result := get_reserved1_external (item)
		ensure
			result_correct: Result = get_reserved1_external (item)
		end

	set_reserved1 (a_value: INTEGER) is
			-- Set member `reserved1'
		require
			exists: exists
		do
			set_reserved1_external (item, a_value)
		ensure
			a_value_set: a_value = reserved1
		end

	savefilename_struct: CFSTRING_STRUCT is
			-- Access member `saveFileName'
		require
			exists: exists
		do
			create Result.make_shared (get_savefilename_external (item))
		ensure
			result_not_void: Result /= Void
			result_has_correct_item: Result.item = savefilename
		end

	set_savefilename_struct (a_value: CFSTRING_STRUCT) is
			-- Set member `saveFileName'
		require
			a_value_not_void: a_value /= Void
			exists: exists
		do
			set_savefilename_external (item, a_value.item)
		ensure
			a_value_set: a_value.item = savefilename
		end

	get_savefilename: POINTER is
		obsolete "Use `savefilename' instead."
			-- Access member `saveFileName'
		require
			exists: exists
		do
			Result := get_savefilename_external (item)
		ensure
			result_correct: Result = get_savefilename_external (item)
		end

	savefilename: POINTER is
			-- Access member `saveFileName'
		require
			exists: exists
		do
			Result := get_savefilename_external (item)
		ensure
			result_correct: Result = get_savefilename_external (item)
		end

	set_savefilename (a_value: POINTER) is
			-- Set member `saveFileName'
		require
			exists: exists
		do
			set_savefilename_external (item, a_value)
		ensure
			a_value_set: a_value = savefilename
		end

	get_savefileextensionhidden: INTEGER is
		obsolete "Use `savefileextensionhidden' instead."
			-- Access member `saveFileExtensionHidden'
		require
			exists: exists
		do
			Result := get_savefileextensionhidden_external (item)
		ensure
			result_correct: Result = get_savefileextensionhidden_external (item)
		end

	savefileextensionhidden: INTEGER is
			-- Access member `saveFileExtensionHidden'
		require
			exists: exists
		do
			Result := get_savefileextensionhidden_external (item)
		ensure
			result_correct: Result = get_savefileextensionhidden_external (item)
		end

	set_savefileextensionhidden (a_value: INTEGER) is
			-- Set member `saveFileExtensionHidden'
		require
			exists: exists
		do
			set_savefileextensionhidden_external (item, a_value)
		ensure
			a_value_set: a_value = savefileextensionhidden
		end

	get_reserved2: INTEGER is
		obsolete "Use `reserved2' instead."
			-- Access member `reserved2'
		require
			exists: exists
		do
			Result := get_reserved2_external (item)
		ensure
			result_correct: Result = get_reserved2_external (item)
		end

	reserved2: INTEGER is
			-- Access member `reserved2'
		require
			exists: exists
		do
			Result := get_reserved2_external (item)
		ensure
			result_correct: Result = get_reserved2_external (item)
		end

	set_reserved2 (a_value: INTEGER) is
			-- Set member `reserved2'
		require
			exists: exists
		do
			set_reserved2_external (item, a_value)
		ensure
			a_value_set: a_value = reserved2
		end

	get_reserved: POINTER is
		obsolete "Use `reserved' instead."
			-- Access member `reserved'
		require
			exists: exists
		do
			Result := get_reserved_external (item)
		ensure
			result_correct: Result = get_reserved_external (item)
		end

	reserved: POINTER is
			-- Access member `reserved'
		require
			exists: exists
		do
			Result := get_reserved_external (item)
		ensure
			result_correct: Result = get_reserved_external (item)
		end

end