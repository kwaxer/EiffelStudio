indexing
	description: "Objects that represent an EV_TITLED_WINDOW.%
		%The original version of this class was generated by EiffelBuild."
	date: "$Date$"
	revision: "$Revision$"

class
	MAIN_WINDOW

inherit
	MAIN_WINDOW_IMP
	
	GRID_ACCESSOR
		undefine
			copy, default_create, is_equal
		end

feature {NONE} -- Initialization

	user_initialization is
			-- Called by `initialize'.
			-- Any custom user initialization that
			-- could not be performed in `initialize',
			-- (due to regeneration of implementation class)
			-- can be added here.
		do
			grid_cell.extend (grid)
			close_request_actions.extend (agent ((create {EV_ENVIRONMENT}).application).destroy)
			status_bar_frame.extend (status_bar)
		end

feature {NONE} -- Implementation

	file_exit_menu_item_selected is
			-- Called by `select_actions' of `file_exit_menu_item'.
		do
			((create {EV_ENVIRONMENT}).application).destroy
		end
	
	profiling_on_menu_item_selected is
			-- Called by `select_actions' of `profiling_on_menu_item'.
		do
			if profiling_on_menu_item.is_selected then
				enable_profile
			else
				disable_profile
			end
		end

	view_tools_menu_item_selected is
			-- Called by `select_actions' of `view_tools_menu_item'.
		do
			if view_tools_menu_item.is_selected then
				tools_notebook.show
			else
				tools_notebook.hide
			end
		end

end -- class MAIN_WINDOW

