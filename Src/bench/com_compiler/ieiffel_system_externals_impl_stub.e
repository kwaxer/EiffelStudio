indexing
	description: "Implemented `IEiffelSystemExternals' Interface."
	Note: "Automatically generated by the EiffelCOM Wizard."

class
	IEIFFEL_SYSTEM_EXTERNALS_IMPL_STUB

inherit
	IEIFFEL_SYSTEM_EXTERNALS_INTERFACE

	ECOM_STUB

feature -- Access

	include_paths: IENUM_INCLUDE_PATHS_INTERFACE is
			-- Include paths.
		do
			-- Put Implementation here.
		end

	object_files: IENUM_OBJECT_FILES_INTERFACE is
			-- Object files.
		do
			-- Put Implementation here.
		end

feature -- Basic Operations

	store is
			-- Save changes.
		do
			-- Put Implementation here.
		end

	add_include_path (include_path: STRING) is
			-- Add a include path to the project.
			-- `include_path' [in].  
		do
			-- Put Implementation here.
		end

	remove_include_path (include_path: STRING) is
			-- Remove a include path from the project.
			-- `include_path' [in].  
		do
			-- Put Implementation here.
		end

	replace_include_path (new_include_path: STRING; old_include_path: STRING) is
			-- Replace an include path in the project.
			-- `new_include_path' [in].  
			-- `old_include_path' [in].  
		do
			-- Put Implementation here.
		end

	add_object_file (object_file: STRING) is
			-- Add a object file to the project.
			-- `object_file' [in].  
		do
			-- Put Implementation here.
		end

	remove_object_file (object_file: STRING) is
			-- Remove a object file from the project.
			-- `object_file' [in].  
		do
			-- Put Implementation here.
		end

	replace_object_file (new_include_path: STRING; old_object_file: STRING) is
			-- Replace an object file in the project.
			-- `new_include_path' [in].  
			-- `old_object_file' [in].  
		do
			-- Put Implementation here.
		end

	create_item is
			-- Initialize `item'
		do
			item := ccom_create_item (Current)
		end

feature {NONE}  -- Externals

	ccom_create_item (eif_object: IEIFFEL_SYSTEM_EXTERNALS_IMPL_STUB): POINTER is
			-- Initialize `item'
		external
			"C++ [new ecom_EiffelComCompiler::IEiffelSystemExternals_impl_stub %"ecom_EiffelComCompiler_IEiffelSystemExternals_impl_stub_s.h%"](EIF_OBJECT)"
		end

end -- IEIFFEL_SYSTEM_EXTERNALS_IMPL_STUB

