indexing 
	description: "WIZARD_FIRST_CHOICE_DIALOG class created by Resource Bench."

class 
	WIZARD_FIRST_CHOICE_DIALOG

inherit
	WEL_MODAL_DIALOG
		redefine
			setup_dialog,
			on_ok,
			parent,
			on_wm_destroy
		end

	APPLICATION_IDS
		export
			{NONE} all
		end

creation
	make

feature {NONE} -- Initialization

	make (a_parent: MAIN_WINDOW) is
			-- Create the dialog.
		require
			a_parent_not_void: a_parent /= Void
			a_parent_exists: a_parent.exists
		do
			make_by_id (a_parent, Wizard_first_choice_dialog_constant)
			create open_project_radio.make_by_id (Current, Open_project_check_constant)
			create create_project_radio.make_by_id (Current, Create_project_check_constant)
			create id_ok.make_by_id (Current, Idok)
			create id_cancel.make_by_id (Current, Idcancel)
			create help_button.make_by_id (Current, Help_button_constant)
			create id_back.make_by_id (Current, Id_back_constant)
			create welcome_static.make_by_id (Current, Title_static_constant)
		end

feature -- Behavior

	setup_dialog is
			-- Disable back button and setup buttons.
		do
			id_back.disable
			open_project_radio.set_checked
			welcome_static.set_font (welcome_font)
			id_ok.set_focus
		end

	on_ok is
			-- Record values of buttons.
		do
			if open_project_radio.checked then
				new_project := False
				Precursor {WEL_MODAL_DIALOG}
			else
				new_project := True
				Precursor {WEL_MODAL_DIALOG}
			end
		end

	on_wm_destroy is
			-- Open project if needed
		do
			if not new_project then
				parent.on_menu_command (Open_string_constant)
			end
			Precursor {WEL_MODAL_DIALOG}
		end

feature -- Access

	open_project_radio: WEL_RADIO_BUTTON
			-- Open existing project button

	new_project: BOOLEAN
			-- Should a new EiffelCOM project be created?
			
	create_project_radio: WEL_RADIO_BUTTON
			-- Create new project button
	
	welcome_static: WEL_STATIC
			-- Welcome message static
			
	id_ok: WEL_PUSH_BUTTON
			-- Next button
			
	id_cancel: WEL_PUSH_BUTTON
			-- Cancel button
			
	help_button: WEL_PUSH_BUTTON
			-- Help button
			
	id_back: WEL_PUSH_BUTTON
			-- Back (greyed) button

	parent: MAIN_WINDOW
			-- Parent window

	welcome_font: WEL_FONT is
			-- Welcome message font
		once
			create Result.make_indirect (welcome_log_font)
		end

	welcome_log_font: WEL_LOG_FONT is
			-- Welcome message log font
		once
			create Result.make (Welcome_font_size, Welcome_font_face_name)
			Result.set_weight (Welcome_font_weight)
		end

	Welcome_font_size: INTEGER is 14
			-- Welcome message font size

	Welcome_font_face_name: STRING is "Verdana"
			-- Welcome message font face name

	Welcome_font_weight: INTEGER is 800
			-- Welcome message font weight

end -- class WIZARD_FIRST_CHOICE_DIALOG

--|-------------------------------------------------------------------
--| This class was automatically generated by Resource Bench
--| Copyright (C) 1996-1997, Interactive Software Engineering, Inc.
--|
--| 270 Storke Road, Suite 7, Goleta, CA 93117 USA
--| Telephone 805-685-1006
--| Fax 805-685-6869
--| Information e-mail <info@eiffel.com>
--| Customer support e-mail <support@eiffel.com>
--|-------------------------------------------------------------------
