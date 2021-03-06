note
	description: "Objects that represent an EV_TITLED_WINDOW.%
		%The original version of this class was generated by EiffelBuild."
	legal: "See notice at end of class."
	status: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

deferred class
	ECDS_MAIN_WINDOW_IMP

inherit
	EV_TITLED_WINDOW
		redefine
			initialize, is_in_default_state
		end
			
	ECDS_CONSTANTS
		undefine
			is_equal, default_create, copy
		end

-- This class is the implementation of an EV_TITLED_WINDOW generated by EiffelBuild.
-- You should not modify this code by hand, as it will be re-generated every time
-- modifications are made to the project.

feature {NONE}-- Initialization

	initialize
			-- Initialize `Current'.
		do
			Precursor {EV_TITLED_WINDOW}
			initialize_constants
			
				-- Create all widgets.
			create main_box
			create global_frame
			create global_box
			create destination_box
			create destination_label
			create path_box
			create location_text_field
			create browse_location_button
			create name_box
			create name_label
			create name_field_box
			create name_text_field
			create name_padding_cell
			create wsdl_frame
			create wsdl_box
			create address_box
			create address_label
			create location_box
			create address_text_field
			create browse_button
			create wdsl_server_box
			create wsdl_server_check_button
			create wsdl_server_padding_cell
			create wsdl_go_button
			create asp_net_frame
			create asp_net_box
			create web_address_box
			create web_address_label
			create web_address_field_box
			create web_address_prefix_label
			create web_address_text_field
			create generate_aspnet_tree_button
			
				-- Build_widget_structure.
			extend (main_box)
			main_box.extend (global_frame)
			global_frame.extend (global_box)
			global_box.extend (destination_box)
			destination_box.extend (destination_label)
			destination_box.extend (path_box)
			path_box.extend (location_text_field)
			path_box.extend (browse_location_button)
			global_box.extend (name_box)
			name_box.extend (name_label)
			name_box.extend (name_field_box)
			name_field_box.extend (name_text_field)
			name_field_box.extend (name_padding_cell)
			main_box.extend (wsdl_frame)
			wsdl_frame.extend (wsdl_box)
			wsdl_box.extend (address_box)
			address_box.extend (address_label)
			address_box.extend (location_box)
			location_box.extend (address_text_field)
			location_box.extend (browse_button)
			wsdl_box.extend (wdsl_server_box)
			wdsl_server_box.extend (wsdl_server_check_button)
			wdsl_server_box.extend (wsdl_server_padding_cell)
			wdsl_server_box.extend (wsdl_go_button)
			main_box.extend (asp_net_frame)
			asp_net_frame.extend (asp_net_box)
			asp_net_box.extend (web_address_box)
			web_address_box.extend (web_address_label)
			web_address_box.extend (web_address_field_box)
			web_address_field_box.extend (web_address_prefix_label)
			web_address_field_box.extend (web_address_text_field)
			web_address_field_box.extend (generate_aspnet_tree_button)
			
			set_minimum_width (500)
			set_minimum_height (380)
			disable_user_resize
			set_title ("Codedom Tree Generator")
			main_box.set_padding_width (5)
			main_box.set_border_width (5)
			main_box.disable_item_expand (global_frame)
			main_box.disable_item_expand (wsdl_frame)
			main_box.disable_item_expand (asp_net_frame)
			global_frame.set_text ("Global Settings")
			global_box.set_padding_width (5)
			global_box.set_border_width (5)
			global_box.disable_item_expand (destination_box)
			global_box.disable_item_expand (name_box)
			destination_box.set_padding_width (5)
			destination_box.set_border_width (5)
			destination_label.set_text (" Directory where Codedom tree should be generated:")
			destination_label.align_text_left
			path_box.set_padding_width (5)
			path_box.disable_item_expand (browse_location_button)
			browse_location_button.set_text ("Browse")
			browse_location_button.set_minimum_width (100)
			name_box.set_padding_width (5)
			name_box.set_border_width (5)
			name_label.set_text (" Filename (without extension):")
			name_label.align_text_left
			name_field_box.set_padding_width (5)
			name_field_box.disable_item_expand (name_padding_cell)
			name_padding_cell.set_minimum_width (100)
			wsdl_frame.set_text ("WSDL Settings")
			wsdl_box.set_padding_width (5)
			wsdl_box.set_border_width (5)
			wsdl_box.disable_item_expand (address_box)
			wsdl_box.disable_item_expand (wdsl_server_box)
			address_box.set_padding_width (5)
			address_box.set_border_width (5)
			address_box.disable_item_expand (address_label)
			address_label.set_text (" WSDL file location (path or URL):")
			address_label.align_text_left
			location_box.set_padding_width (5)
			location_box.disable_item_expand (browse_button)
			browse_button.set_text ("Browse")
			browse_button.set_minimum_width (100)
			wdsl_server_box.set_padding_width (5)
			wdsl_server_box.set_border_width (5)
			wdsl_server_box.disable_item_expand (wsdl_server_check_button)
			wdsl_server_box.disable_item_expand (wsdl_go_button)
			wsdl_server_check_button.set_text ("Generate code for server")
			wsdl_go_button.disable_sensitive
			wsdl_go_button.set_text ("Generate")
			wsdl_go_button.set_minimum_width (100)
			asp_net_frame.set_text ("ASP.NET Settings")
			asp_net_box.set_padding_width (5)
			asp_net_box.set_border_width (5)
			web_address_box.set_padding_width (5)
			web_address_box.set_border_width (5)
			web_address_label.set_text (" Web page location:")
			web_address_label.align_text_left
			web_address_field_box.set_padding_width (5)
			web_address_field_box.disable_item_expand (web_address_prefix_label)
			web_address_field_box.disable_item_expand (generate_aspnet_tree_button)
			web_address_prefix_label.set_text (" http://localhost/")
			web_address_prefix_label.align_text_left
			generate_aspnet_tree_button.disable_sensitive
			generate_aspnet_tree_button.set_text ("Generate")
			generate_aspnet_tree_button.set_minimum_width (100)
			
				--Connect events.
			browse_location_button.select_actions.extend (agent on_directory_browse)
			name_text_field.change_actions.extend (agent on_filename_change)
			browse_button.select_actions.extend (agent on_wsdl_browse)
			wsdl_go_button.select_actions.extend (agent on_generate_wsdl_tree)
			web_address_text_field.change_actions.extend (agent on_web_address_change)
			generate_aspnet_tree_button.select_actions.extend (agent on_generate_aspnet_tree)
				-- Close the application when an interface close
				-- request is received on `Current'. i.e. the cross is clicked.

				-- Call `user_initialization'.
			user_initialization
		end

feature -- Access

	main_box, global_box, destination_box, name_box, wsdl_box, address_box, asp_net_box, 
	web_address_box: EV_VERTICAL_BOX
	global_frame, wsdl_frame, asp_net_frame: EV_FRAME
	destination_label, name_label, address_label, web_address_label, web_address_prefix_label: EV_LABEL
	path_box, name_field_box, location_box, wdsl_server_box, web_address_field_box: EV_HORIZONTAL_BOX
	location_text_field, name_text_field, address_text_field, web_address_text_field: EV_TEXT_FIELD
	browse_location_button, browse_button, wsdl_go_button, generate_aspnet_tree_button: EV_BUTTON
	name_padding_cell, wsdl_server_padding_cell: EV_CELL
	wsdl_server_check_button: EV_CHECK_BUTTON

feature {NONE} -- Implementation

	is_in_default_state: BOOLEAN
			-- Is `Current' in its default state?
		do
			-- Re-implement if you wish to enable checking
			-- for `Current'.
			Result := True
		end
	
	user_initialization
			-- Feature for custom initialization, called at end of `initialize'.
		deferred
		end
	
	on_directory_browse
			-- Called by `select_actions' of `browse_location_button'.
		deferred
		end
	
	on_filename_change
			-- Called by `change_actions' of `name_text_field'.
		deferred
		end
	
	on_wsdl_browse
			-- Called by `select_actions' of `browse_button'.
		deferred
		end
	
	on_generate_wsdl_tree
			-- Called by `select_actions' of `wsdl_go_button'.
		deferred
		end
	
	on_web_address_change
			-- Called by `change_actions' of `web_address_text_field'.
		deferred
		end
	
	on_generate_aspnet_tree
			-- Called by `select_actions' of `generate_aspnet_tree_button'.
		deferred
		end
	

note
	copyright:	"Copyright (c) 1984-2006, Eiffel Software"
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
end -- class ECDS_MAIN_WINDOW_IMP
