note
	description: "Control interfaces. Help file: "
	legal: "See notice at end of class."
	status: "See notice at end of class."
	generator: "Automatically generated by the EiffelCOM Wizard."

deferred class
	IPER_PROPERTY_BROWSING_INTERFACE

inherit
	ECOM_INTERFACE

feature -- Status Report

	get_display_string_user_precondition (disp_id: INTEGER; p_bstr: CELL [STRING]): BOOLEAN
			-- User-defined preconditions for `get_display_string'.
			-- Redefine in descendants if needed.
		do
			Result := True
		end

	map_property_to_page_user_precondition (disp_id: INTEGER; p_clsid: ECOM_GUID): BOOLEAN
			-- User-defined preconditions for `map_property_to_page'.
			-- Redefine in descendants if needed.
		do
			Result := True
		end

	get_predefined_strings_user_precondition (disp_id: INTEGER; p_ca_strings_out: TAG_CALPOLESTR_RECORD; p_ca_cookies_out: TAG_CADWORD_RECORD): BOOLEAN
			-- User-defined preconditions for `get_predefined_strings'.
			-- Redefine in descendants if needed.
		do
			Result := True
		end

	get_predefined_value_user_precondition (disp_id: INTEGER; dw_cookie: INTEGER; p_var_out: ECOM_VARIANT): BOOLEAN
			-- User-defined preconditions for `get_predefined_value'.
			-- Redefine in descendants if needed.
		do
			Result := True
		end

feature -- Basic Operations

	get_display_string (disp_id: INTEGER; p_bstr: CELL [STRING])
			-- No description available.
			-- `disp_id' [in].  
			-- `p_bstr' [out].  
		require
			non_void_p_bstr: p_bstr /= Void
			get_display_string_user_precondition: get_display_string_user_precondition (disp_id, p_bstr)
		deferred

		ensure
			valid_p_bstr: p_bstr.item /= Void
		end

	map_property_to_page (disp_id: INTEGER; p_clsid: ECOM_GUID)
			-- No description available.
			-- `disp_id' [in].  
			-- `p_clsid' [out].  
		require
			non_void_p_clsid: p_clsid /= Void
			valid_p_clsid: p_clsid.item /= default_pointer
			map_property_to_page_user_precondition: map_property_to_page_user_precondition (disp_id, p_clsid)
		deferred

		end

	get_predefined_strings (disp_id: INTEGER; p_ca_strings_out: TAG_CALPOLESTR_RECORD; p_ca_cookies_out: TAG_CADWORD_RECORD)
			-- No description available.
			-- `disp_id' [in].  
			-- `p_ca_strings_out' [out].  
			-- `p_ca_cookies_out' [out].  
		require
			non_void_p_ca_strings_out: p_ca_strings_out /= Void
			valid_p_ca_strings_out: p_ca_strings_out.item /= default_pointer
			non_void_p_ca_cookies_out: p_ca_cookies_out /= Void
			valid_p_ca_cookies_out: p_ca_cookies_out.item /= default_pointer
			get_predefined_strings_user_precondition: get_predefined_strings_user_precondition (disp_id, p_ca_strings_out, p_ca_cookies_out)
		deferred

		end

	get_predefined_value (disp_id: INTEGER; dw_cookie: INTEGER; p_var_out: ECOM_VARIANT)
			-- No description available.
			-- `disp_id' [in].  
			-- `dw_cookie' [in].  
			-- `p_var_out' [out].  
		require
			non_void_p_var_out: p_var_out /= Void
			valid_p_var_out: p_var_out.item /= default_pointer
			get_predefined_value_user_precondition: get_predefined_value_user_precondition (disp_id, dw_cookie, p_var_out)
		deferred

		end

note
	copyright:	"Copyright (c) 1984-2006, Eiffel Software and others"
	license:	"Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			 Eiffel Software
			 356 Storke Road, Goleta, CA 93117 USA
			 Telephone 805-685-1006, Fax 805-685-6869
			 Website http://www.eiffel.com
			 Customer support http://support.eiffel.com
		]"




end -- IPER_PROPERTY_BROWSING_INTERFACE

