indexing
	description: "Implemented `IEiffelSystemAssemblies' Interface."
	Note: "Automatically generated by the EiffelCOM Wizard."

class
	IEIFFEL_SYSTEM_ASSEMBLIES_IMPL_PROXY

inherit
	IEIFFEL_SYSTEM_ASSEMBLIES_INTERFACE

	ECOM_QUERIABLE

creation
	make_from_other,
	make_from_pointer

feature {NONE}  -- Initialization

	make_from_pointer (cpp_obj: POINTER) is
			-- Make from pointer
		do
			initializer := ccom_create_ieiffel_system_assemblies_impl_proxy_from_pointer(cpp_obj)
			item := ccom_item (initializer)
		end

feature -- Access

	last_exception: IEIFFEL_EXCEPTION_INTERFACE is
			-- Last execption to occur
		do
			Result := ccom_last_exception (initializer)
		end

feature -- Status Report

	last_error_code: INTEGER is
			-- Last error code.
		do
			Result := ccom_last_error_code (initializer)
		end

	last_error_description: STRING is
			-- Last error description.
		do
			Result := ccom_last_error_description (initializer)
		end

	last_error_help_file: STRING is
			-- Last error help file.
		do
			Result := ccom_last_error_help_file (initializer)
		end

	last_source_of_exception: STRING is
			-- Last source of exception.
		do
			Result := ccom_last_source_of_exception (initializer)
		end

feature -- Basic Operations

	wipe_out is
			-- Wipe out current list of assemblies
		do
			ccom_wipe_out (initializer)
		end

	add_assembly (a_prefix: STRING; a_cluster_name: STRING; a_path: STRING; a_copy: BOOLEAN) is
			-- Add an assembly to the project.
			-- `a_prefix' [in].  
			-- `a_cluster_name' [in].  
			-- `a_path' [in].  
			-- `a_copy' [out].  
		do
			ccom_add_assembly (initializer, a_prefix, a_cluster_name, a_path, a_copy)
		end

	store is
			-- Save changes.
		do
			ccom_store (initializer)
		end

feature {NONE}  -- Implementation

	delete_wrapper is
			-- Delete wrapper
		do
			ccom_delete_ieiffel_system_assemblies_impl_proxy(initializer)
		end

feature {NONE}  -- Externals

	ccom_wipe_out (cpp_obj: POINTER) is
			-- Wipe out current list of assemblies
		external
			"C++ [ecom_EiffelComCompiler::IEiffelSystemAssemblies_impl_proxy %"ecom_EiffelComCompiler_IEiffelSystemAssemblies_impl_proxy_s.h%"]()"
		end

	ccom_add_assembly (cpp_obj: POINTER; a_prefix: STRING; a_cluster_name: STRING; a_path: STRING; a_copy: BOOLEAN) is
			-- Add an assembly to the project.
		external
			"C++ [ecom_EiffelComCompiler::IEiffelSystemAssemblies_impl_proxy %"ecom_EiffelComCompiler_IEiffelSystemAssemblies_impl_proxy_s.h%"](EIF_OBJECT,EIF_OBJECT,EIF_OBJECT,EIF_BOOLEAN)"
		end

	ccom_last_exception (cpp_obj: POINTER): IEIFFEL_EXCEPTION_INTERFACE is
			-- Last execption to occur
		external
			"C++ [ecom_EiffelComCompiler::IEiffelSystemAssemblies_impl_proxy %"ecom_EiffelComCompiler_IEiffelSystemAssemblies_impl_proxy_s.h%"](): EIF_REFERENCE"
		end

	ccom_store (cpp_obj: POINTER) is
			-- Save changes.
		external
			"C++ [ecom_EiffelComCompiler::IEiffelSystemAssemblies_impl_proxy %"ecom_EiffelComCompiler_IEiffelSystemAssemblies_impl_proxy_s.h%"]()"
		end

	ccom_delete_ieiffel_system_assemblies_impl_proxy (a_pointer: POINTER) is
			-- Release resource
		external
			"C++ [delete ecom_EiffelComCompiler::IEiffelSystemAssemblies_impl_proxy %"ecom_EiffelComCompiler_IEiffelSystemAssemblies_impl_proxy_s.h%"]()"
		end

	ccom_create_ieiffel_system_assemblies_impl_proxy_from_pointer (a_pointer: POINTER): POINTER is
			-- Create from pointer
		external
			"C++ [new ecom_EiffelComCompiler::IEiffelSystemAssemblies_impl_proxy %"ecom_EiffelComCompiler_IEiffelSystemAssemblies_impl_proxy_s.h%"](IUnknown *)"
		end

	ccom_item (cpp_obj: POINTER): POINTER is
			-- Item
		external
			"C++ [ecom_EiffelComCompiler::IEiffelSystemAssemblies_impl_proxy %"ecom_EiffelComCompiler_IEiffelSystemAssemblies_impl_proxy_s.h%"]():EIF_POINTER"
		end

	ccom_last_error_code (cpp_obj: POINTER): INTEGER is
			-- Last error code
		external
			"C++ [ecom_EiffelComCompiler::IEiffelSystemAssemblies_impl_proxy %"ecom_EiffelComCompiler_IEiffelSystemAssemblies_impl_proxy_s.h%"]():EIF_INTEGER"
		end

	ccom_last_error_description (cpp_obj: POINTER): STRING is
			-- Last error description
		external
			"C++ [ecom_EiffelComCompiler::IEiffelSystemAssemblies_impl_proxy %"ecom_EiffelComCompiler_IEiffelSystemAssemblies_impl_proxy_s.h%"]():EIF_REFERENCE"
		end

	ccom_last_error_help_file (cpp_obj: POINTER): STRING is
			-- Last error help file
		external
			"C++ [ecom_EiffelComCompiler::IEiffelSystemAssemblies_impl_proxy %"ecom_EiffelComCompiler_IEiffelSystemAssemblies_impl_proxy_s.h%"]():EIF_REFERENCE"
		end

	ccom_last_source_of_exception (cpp_obj: POINTER): STRING is
			-- Last source of exception
		external
			"C++ [ecom_EiffelComCompiler::IEiffelSystemAssemblies_impl_proxy %"ecom_EiffelComCompiler_IEiffelSystemAssemblies_impl_proxy_s.h%"]():EIF_REFERENCE"
		end

end -- IEIFFEL_SYSTEM_ASSEMBLIES_IMPL_PROXY

