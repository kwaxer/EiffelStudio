indexing

	description: 
		"Error when feature is not legally exported.";
	date: "$Date$";
	revision: "$Revision $"

class VAPE 

inherit

	FEATURE_ERROR
		redefine
			build_explain, is_defined
		end;

feature 

	code: STRING is "VAPE";
			-- Error code

	exported_feature: E_FEATURE;

feature -- Access

	is_defined: BOOLEAN is
			-- Is the error fully defined?
		do
			Result := is_class_defined and then
				is_feature_defined and then	
				exported_feature /= Void
		ensure then
			valid_exported_feature: Result implies exported_feature /= Void
		end

feature -- Output

	build_explain (ow: OUTPUT_WINDOW) is
		local
			ec: E_CLASS
		do
			ec := exported_feature.written_class;
			ow.put_string ("Insufficiently exported feature: ");
			exported_feature.append_name (ow, ec);
			ow.put_string (" from ");
			ec.append_name (ow);
			ow.new_line;
		end;

feature {ACCESS_FEAT_AS_B} -- Setting

	set_exported_feature (f: FEATURE_I) is
		require
			valid_f: f /= Void
		do
			exported_feature := f.api_feature;
		end;

end -- class VAPE
