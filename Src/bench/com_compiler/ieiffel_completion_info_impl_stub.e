indexing
	description: "Implemented `IEiffelCompletionInfo' Interface."
	Note: "Automatically generated by the EiffelCOM Wizard."

class
	IEIFFEL_COMPLETION_INFO_IMPL_STUB

inherit
	IEIFFEL_COMPLETION_INFO_INTERFACE

	ECOM_STUB

feature -- Basic Operations

	add_local (name: STRING; type: STRING) is
			-- Add a local variable used for solving member completion list
			-- `name' [in].  
			-- `type' [in].  
		do
			-- Put Implementation here.
		end

	add_argument (name: STRING; type: STRING) is
			-- Add an argument used for solving member completion list
			-- `name' [in].  
			-- `type' [in].  
		do
			-- Put Implementation here.
		end

	target_features (target: STRING; feature_name: STRING; file_name: STRING; return_names: ECOM_VARIANT; return_signatures: ECOM_VARIANT; return_image_indexes: ECOM_VARIANT) is
			-- Features accessible from target.
			-- `target' [in].  
			-- `feature_name' [in].  
			-- `file_name' [in].  
			-- `return_names' [out].  
			-- `return_signatures' [out].  
			-- `return_image_indexes' [out].  
		do
			-- Put Implementation here.
		end

	target_feature (target: STRING; feature_name: STRING; file_name: STRING): IEIFFEL_FEATURE_DESCRIPTOR_INTERFACE is
			-- Feature information
			-- `target' [in].  
			-- `feature_name' [in].  
			-- `file_name' [in].  
		do
			-- Put Implementation here.
		end

	flush_completion_features (a_file_name: STRING) is
			-- Flush temporary completion features for a specifi file
			-- `a_file_name' [in].  
		do
			-- Put Implementation here.
		end

	initialize_feature (a_name: STRING; a_arguments: ECOM_VARIANT; a_argument_types: ECOM_VARIANT; a_return_type: STRING; a_feature_type: INTEGER; a_file_name: STRING) is
			-- Initialize a feature for completion without compiltation
			-- `a_name' [in].  
			-- `a_arguments' [in].  
			-- `a_argument_types' [in].  
			-- `a_return_type' [in].  
			-- `a_feature_type' [in].  
			-- `a_file_name' [in].  
		do
			-- Put Implementation here.
		end

	create_item is
			-- Initialize `item'
		do
			item := ccom_create_item (Current)
		end

feature {NONE}  -- Externals

	ccom_create_item (eif_object: IEIFFEL_COMPLETION_INFO_IMPL_STUB): POINTER is
			-- Initialize `item'
		external
			"C++ [new ecom_EiffelComCompiler::IEiffelCompletionInfo_impl_stub %"ecom_EiffelComCompiler_IEiffelCompletionInfo_impl_stub_s.h%"](EIF_OBJECT)"
		end

end -- IEIFFEL_COMPLETION_INFO_IMPL_STUB

