indexing
	description: "Objects that represent an EV_DIALOG.%
		%The original version of this class was generated by EiffelBuild."
	date: "$Date$"
	revision: "$Revision$"

deferred class
	TOC_NEW_DIALOG_IMP

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
		do
			Precursor {EV_DIALOG}
			initialize_constants
			
				-- Create all widgets.
			create l_ev_vertical_box_1
			create l_ev_label_1
			create l_ev_horizontal_box_1
			create l_ev_label_2
			create toc_name_text
			create l_ev_vertical_box_2
			create project_radio
			create empty_radio
			create dir_radio
			create custom_radio
			create tree_container
			create l_ev_cell_1
			create l_ev_horizontal_box_2
			create l_ev_cell_2
			create okay_button
			create cancel_button
			create l_ev_cell_3
			
				-- Build_widget_structure.
			extend (l_ev_vertical_box_1)
			l_ev_vertical_box_1.extend (l_ev_label_1)
			l_ev_vertical_box_1.extend (l_ev_horizontal_box_1)
			l_ev_horizontal_box_1.extend (l_ev_label_2)
			l_ev_horizontal_box_1.extend (toc_name_text)
			l_ev_vertical_box_1.extend (l_ev_vertical_box_2)
			l_ev_vertical_box_2.extend (project_radio)
			l_ev_vertical_box_2.extend (empty_radio)
			l_ev_vertical_box_2.extend (dir_radio)
			l_ev_vertical_box_2.extend (custom_radio)
			l_ev_vertical_box_2.extend (tree_container)
			l_ev_vertical_box_1.extend (l_ev_cell_1)
			l_ev_vertical_box_1.extend (l_ev_horizontal_box_2)
			l_ev_horizontal_box_2.extend (l_ev_cell_2)
			l_ev_horizontal_box_2.extend (okay_button)
			l_ev_horizontal_box_2.extend (cancel_button)
			l_ev_horizontal_box_2.extend (l_ev_cell_3)
			
			l_ev_vertical_box_1.set_padding_width (5)
			l_ev_vertical_box_1.set_border_width (2)
			l_ev_vertical_box_1.disable_item_expand (l_ev_label_1)
			l_ev_vertical_box_1.disable_item_expand (l_ev_horizontal_box_1)
			l_ev_vertical_box_1.disable_item_expand (l_ev_cell_1)
			l_ev_vertical_box_1.disable_item_expand (l_ev_horizontal_box_2)
			l_ev_label_1.set_text ("A new Table of Contents may be generated from the project directory%Nstructure, or may be created empty.")
			l_ev_label_1.align_text_left
			l_ev_horizontal_box_1.set_padding_width (5)
			l_ev_horizontal_box_1.set_border_width (2)
			l_ev_horizontal_box_1.disable_item_expand (l_ev_label_2)
			l_ev_label_2.set_text ("Name")
			l_ev_label_2.align_text_left
			l_ev_vertical_box_2.set_padding_width (5)
			l_ev_vertical_box_2.set_border_width (2)
			l_ev_vertical_box_2.disable_item_expand (project_radio)
			l_ev_vertical_box_2.disable_item_expand (empty_radio)
			l_ev_vertical_box_2.disable_item_expand (dir_radio)
			l_ev_vertical_box_2.disable_item_expand (custom_radio)
			project_radio.set_text ("Make as copy of project directory structure (include everything)")
			empty_radio.set_text ("Make empty (include nothing)")
			dir_radio.set_text ("Make from project settings (include folders specified in project file)")
			custom_radio.set_text ("Make from folders below:")
			tree_container.set_minimum_height (100)
			l_ev_horizontal_box_2.set_padding_width (5)
			l_ev_horizontal_box_2.set_border_width (2)
			l_ev_horizontal_box_2.disable_item_expand (okay_button)
			l_ev_horizontal_box_2.disable_item_expand (cancel_button)
			okay_button.set_text ("OK")
			okay_button.set_minimum_width (button_width)
			cancel_button.set_text ("Cancel")
			cancel_button.set_minimum_width (button_width)
			set_minimum_width (dialog_tall_height)
			set_minimum_height (dialog_wide_width)
			set_maximum_width (3000)
			set_maximum_height (3000)
			set_title ("New Table of Contents")
			
				--Connect events.
				-- Close the application when an interface close
				-- request is recieved on `Current'. i.e. the cross is clicked.

				-- Call `user_initialization'.
			user_initialization
		end

feature -- Access

	l_ev_cell_1: EV_CELL
	l_ev_cell_2: EV_CELL
	l_ev_cell_3: EV_CELL
	okay_button: EV_BUTTON
	cancel_button: EV_BUTTON
	project_radio: EV_RADIO_BUTTON
	empty_radio: EV_RADIO_BUTTON
	dir_radio: EV_RADIO_BUTTON
	custom_radio: EV_RADIO_BUTTON
	l_ev_horizontal_box_1: EV_HORIZONTAL_BOX
	l_ev_horizontal_box_2: EV_HORIZONTAL_BOX
	l_ev_vertical_box_1: EV_VERTICAL_BOX
	l_ev_vertical_box_2: EV_VERTICAL_BOX
	tree_container: EV_VERTICAL_BOX
	l_ev_label_1: EV_LABEL
	l_ev_label_2: EV_LABEL
	toc_name_text: EV_TEXT_FIELD

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
	
end -- class TOC_NEW_DIALOG_IMP
