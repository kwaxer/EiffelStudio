﻿note
	description: "[
					Generated by EiffelRibbon tool
					Don't edit this file, since it will be replaced by EiffelRibbon tool
					generated files everytime
																							]"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION_MENU

inherit
	EV_RIBBON_APPLICATION_MENU
		
create
	make_with_command_list

feature {NONE} -- Initialization

	create_interface_objects
			-- Create objects
		do
			create menu_group.make_with_command_list (<<{COMMAND_NAME_CONSTANTS}.menu_group>>)

			create groups.make (1)
			groups.extend (menu_group)

		end
		
feature -- Query
	menu_group: MENU_GROUP


end

