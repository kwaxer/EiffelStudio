note
	description: "Wizard Initial Step"
	author: "Generated by the Wizard wizard"
	date: "$Date$"
	revision: "$Revision$"

class
	WIZARD_INITIAL_STATE

inherit
	WIZARD_INITIAL_STATE_WINDOW
		redefine
			proceed_with_current_info
		end

create
	make

feature {NONE} -- Implementation

	proceed_with_current_info 
			-- Go to next step.
		do
			Precursor
			proceed_with_new_state(Create {WIZARD_FIRST_STATE}.make(wizard_information))
		end

	display_state_text
			-- Set the messages for this state.
		do
			title.set_text ("Welcome to the%N${FL_WIZARD_NAME} Wizard")
			message.set_text ("Describe here what your wizard does.")
		end
	
	pixmap_icon_location: PATH
			-- Icon for the Eiffel Store Wizard
		once
			create Result.make_from_string ("eiffel_wizard_icon.png")
		end

end
