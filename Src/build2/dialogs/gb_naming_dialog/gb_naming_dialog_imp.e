indexing
	description: "Objects that represent an EV_DIALOG.%
		%The original version of this class was generated by EiffelBuild."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	GB_NAMING_DIALOG_IMP

inherit
	EV_DIALOG
		redefine
			initialize, is_in_default_state
		end
			
	CONSTANTS
		undefine
			is_equal, default_create, copy
		end

-- This class is the implementation of an EV_DIALOG generated by EiffelBuild.
-- You should not modify this code by hand, as it will be re-generated every time
-- modifications are made to the project.

feature {NONE}-- Initialization

	initialize is
			-- Initialize `Current'.
		local 
			l_ev_vertical_box_1, l_ev_vertical_box_2: EV_VERTICAL_BOX
			l_ev_horizontal_box_1, l_ev_horizontal_box_2: EV_HORIZONTAL_BOX
			l_ev_cell_1, l_ev_cell_2, l_ev_cell_3: EV_CELL
		do
			Precursor {EV_DIALOG}
			initialize_constants
			
				-- Create all widgets.
			create l_ev_vertical_box_1
			create l_ev_vertical_box_2
			create prompt_label
			create l_ev_horizontal_box_1
			create name_field
			create l_ev_cell_1
			create l_ev_horizontal_box_2
			create l_ev_cell_2
			create ok_button
			create l_ev_cell_3
			create cancel_button
			
				-- Build_widget_structure.
			extend (l_ev_vertical_box_1)
			l_ev_vertical_box_1.extend (l_ev_vertical_box_2)
			l_ev_vertical_box_2.extend (prompt_label)
			l_ev_vertical_box_2.extend (l_ev_horizontal_box_1)
			l_ev_horizontal_box_1.extend (name_field)
			l_ev_vertical_box_2.extend (l_ev_cell_1)
			l_ev_vertical_box_2.extend (l_ev_horizontal_box_2)
			l_ev_horizontal_box_2.extend (l_ev_cell_2)
			l_ev_horizontal_box_2.extend (ok_button)
			l_ev_horizontal_box_2.extend (l_ev_cell_3)
			l_ev_horizontal_box_2.extend (cancel_button)
			
			set_minimum_width (250)
			set_minimum_height (120)
			set_title ("Display window")
			l_ev_vertical_box_1.set_padding_width (large_spacing_width)
			l_ev_vertical_box_1.set_border_width (small_padding)
			l_ev_vertical_box_2.disable_item_expand (prompt_label)
			l_ev_vertical_box_2.disable_item_expand (l_ev_horizontal_box_1)
			l_ev_vertical_box_2.disable_item_expand (l_ev_horizontal_box_2)
			prompt_label.align_text_left
			l_ev_cell_1.set_minimum_height (small_padding)
			l_ev_horizontal_box_2.disable_item_expand (ok_button)
			l_ev_horizontal_box_2.disable_item_expand (l_ev_cell_3)
			l_ev_horizontal_box_2.disable_item_expand (cancel_button)
			ok_button.set_text (ok_button_text)
			ok_button.set_minimum_width (default_button_width)
			l_ev_cell_3.set_minimum_width (small_padding)
			cancel_button.set_text (cancel_button_text)
			cancel_button.set_minimum_width (default_button_width)
			
				--Connect events.
				-- Close the application when an interface close
				-- request is recieved on `Current'. i.e. the cross is clicked.

				-- Call `user_initialization'.
			user_initialization
		end

feature -- Access

	prompt_label: EV_LABEL
	name_field: EV_TEXT_FIELD
	ok_button, cancel_button: EV_BUTTON

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
	
end -- class GB_NAMING_DIALOG_IMP
