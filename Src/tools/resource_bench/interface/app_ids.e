note
	description: "Constants definition of Resource Bench"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	product: "Resource Bench"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION_IDS

feature -- Access 

		-- Menus
	Idr_menu: INTEGER = 101
	Cmd_file_new: INTEGER = 40010
	Cmd_file_open: INTEGER = 40001
	cmd_file_close: INTEGER = 40002
	Cmd_file_save_project: INTEGER = 40009
	Cmd_file_exit: INTEGER = 40003

	Cmd_build_wel_code: INTEGER = 40004
	Cmd_build_resource_file: INTEGER = 40011 

	Cmd_edit_cut: INTEGER = 40012
	Cmd_edit_copy: INTEGER = 40013
	Cmd_edit_paste: INTEGEr = 40014

	Cmd_help_content: INTEGER = 40006
	Cmd_help_about_rb: INTEGER = 40007


		-- Dialogs
	Idd_dialog_message: INTEGER = 200
	Idd_dialog_error: INTEGER = 201
	Idd_dialog_about: INTEGER = 202
	Idc_info: INTEGER = 1000
	Idc_static: INTEGER = -1

	Idd_dialog_browse: INTEGER = 203
	Idc_edit_path: INTEGER = 1000

	Idd_dialog_properties_constant: INTEGER = 204
	Idc_class_name_constant: INTEGER = 1000
	Idc_check_code_generation_constant: INTEGER = 1001
	Idc_control_list_constant: INTEGER = 1002
	Idc_dialog_caption_constant: INTEGER = 1018
	Idc_modal_constant: INTEGER = 1015
	Idc_modeless_constant: INTEGER = 1016
	Idc_main_dialog_constant: INTEGER = 1017
	Idc_setup_dialog_constant: INTEGER = 1006
	Idc_notify_constant: INTEGER = 1007
	Idc_on_ok_constant: INTEGER = 1008
	Idc_on_cancel_constant: INTEGER = 1009
	Idc_on_abort_constant: INTEGER = 1010
	Idc_on_ignore_constant: INTEGER = 1011
	Idc_on_retry_constant: INTEGER = 1012
	Idc_on_yes_constant: INTEGER = 1013
	Idc_on_no_constant: INTEGER = 1014

		-- Icons
	Rb_icon: INTEGER = 1


		-- Accelerators
	Idr_accelerator: INTEGER = 101


		-- Toolbar
	Idr_toolbar: INTEGER = 103;


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
end -- class APPLICATION_IDS
