indexing
	description: "Objects that represent an EV_DIALOG.%
		%The original version of this class was generated by EiffelBuild."
	date: "$Date$"
	revision: "$Revision$"

deferred class
	EB_GOTO_DIALOG_IMP

inherit
	EV_DIALOG
		redefine
			initialize, is_in_default_state
		end

-- This class is the implementation of an EV_DIALOG generated by EiffelBuild.
-- You should not modify this code by hand, as it will be re-generated every time
-- modifications are made to the project.

feature {NONE}-- Initialization

	initialize is
			-- Initialize `Current'.
		local 
			l_ev_vertical_box_1: EV_VERTICAL_BOX
			l_ev_horizontal_box_1: EV_HORIZONTAL_BOX
			l_ev_cell_1: EV_CELL
		do
			Precursor {EV_DIALOG}
			
				-- Create all widgets.
			create l_ev_vertical_box_1
			create line_number_label
			create line_number_text
			create l_ev_horizontal_box_1
			create l_ev_cell_1
			create go_button
			create cancel_button
			
				-- Build_widget_structure.
			extend (l_ev_vertical_box_1)
			l_ev_vertical_box_1.extend (line_number_label)
			l_ev_vertical_box_1.extend (line_number_text)
			l_ev_vertical_box_1.extend (l_ev_horizontal_box_1)
			l_ev_vertical_box_1.set_padding_width (10)
			l_ev_horizontal_box_1.extend (l_ev_cell_1)
			l_ev_horizontal_box_1.extend (go_button)
			l_ev_horizontal_box_1.extend (cancel_button)
			
			set_minimum_width (250)
			set_minimum_height (120)
			disable_user_resize
			set_title ("Go To Line")
			l_ev_vertical_box_1.set_padding_width (10)
			l_ev_vertical_box_1.set_border_width (10)
			l_ev_vertical_box_1.disable_item_expand (line_number_label)
			l_ev_vertical_box_1.disable_item_expand (line_number_text)
			l_ev_vertical_box_1.disable_item_expand (l_ev_horizontal_box_1)
			line_number_label.set_text ("Line number")
			line_number_label.align_text_left
			l_ev_horizontal_box_1.set_padding_width (10)
			go_button.set_text ("Go To")
			cancel_button.set_text ("Cancel")
			
				--Connect events.
				-- Close the application when an interface close
				-- request is recieved on `Current'. i.e. the cross is clicked.

				-- Call `user_initialization'.
			user_initialization
		end

feature -- Access

	line_number_label: EV_LABEL
	line_number_text: EV_SPIN_BUTTON
	go_button, cancel_button: EV_BUTTON

feature {NONE} -- Implementation

	is_in_default_state: BOOLEAN is
			-- Is `Current' in its default state?
		do
			-- Re-implement if you wish to enable checking
			-- for `Current'.
			Result := True
		end
	
	user_initialization is
			-- Feature for custom initialization, called at end of `initialize'.
		deferred
		end
	
end -- class GOTO_DIALOG_IMP
