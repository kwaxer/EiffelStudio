

class OPEN_PROJ_WIN 

inherit

	PROJECT_WINDOW;
	WINDOWS

creation

	make
	
feature 

	ok_pressed is
			-- Command executed when ok button
			-- is pressed.
		local
			cmd: OPEN_PROJECT
		do
			if main_panel.project_initialized then
				context_catalog.clear;
				command_catalog.clear;
				command_catalog.initialize_pages;
				app_editor.clear;
				history_window.wipe_out;
				main_panel.unset_project_initialized;
			end;
			!!cmd;
			if selected_file.empty then
				cmd.execute (directory);
			else
				cmd.execute (selected_file);
			end;
		end;

end	
