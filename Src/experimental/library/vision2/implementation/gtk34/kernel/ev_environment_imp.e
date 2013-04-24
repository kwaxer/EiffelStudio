note
	description:
		"Eiffel Vision Environment. GTK implementation."
	legal: "See notice at end of class."
	status: "See notice at end of class."
	keywords: "environment, global, system"
	date: "$Date: 2012-05-11 14:37:29 -0700 (Fri, 11 May 2012) $"
	revision: "$Revision$"

class
	EV_ENVIRONMENT_IMP

inherit
	EV_ENVIRONMENT_I
		export
			{ANY} is_destroyed
		end

	EXECUTION_ENVIRONMENT

create
	make

feature {NONE} -- Initialization

	old_make (an_interface: like interface)
			-- Pass `an_interface' to base make.
		do
			assign_interface (an_interface)
		end

	make
			-- No initialization needed.
		do
			set_is_initialized (True)
		end

feature -- Access

	supported_image_formats: LINEAR [STRING_32]
			-- `Result' contains all supported image formats
			-- on current platform, in the form of their three letter extension.
			-- e.g. PNG, BMP, ICO
		local
			app_imp: detachable EV_APPLICATION_IMP
		once
			app_imp ?= (create {EV_ENVIRONMENT}).implementation.application_i
			check app_imp /= Void end
			Result := app_imp.readable_pixbuf_formats.linear_representation
			Result.compare_objects
		end

	mouse_wheel_scroll_lines: INTEGER
			-- Default number of lines to scroll in response to
			-- a mouse wheel scroll event.
		do
			Result := 3
		end

	default_pointer_style_width: INTEGER
			-- Default pointer style width.
		do
			Result := {GTK2}.gdk_display_get_default_cursor_size ({GTK2}.gdk_display_get_default)
		end

	default_pointer_style_height: INTEGER
			-- Default pointer style height.
		do
			Result := {GTK2}.gdk_display_get_default_cursor_size ({GTK2}.gdk_display_get_default)
		end

	has_printer: BOOLEAN
			-- Is a default printer available?
			-- `Result' is `True' if at least one printer is installed.
		do
			system ("which lpr > /dev/null 2>&1")
			Result := return_code = 0
		end

	font_families: LINEAR [STRING_32]
			-- List of fonts available on the system
		local
			app_imp: detachable EV_APPLICATION_IMP
		once
			app_imp ?= (create {EV_ENVIRONMENT}).implementation.application_i
			check app_imp /= Void end
			Result := app_imp.font_names_on_system.linear_representation
			Result.compare_objects
		end

note
	copyright:	"Copyright (c) 1984-2006, Eiffel Software and others"
	license:	"Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			 Eiffel Software
			 356 Storke Road, Goleta, CA 93117 USA
			 Telephone 805-685-1006, Fax 805-685-6869
			 Website http://www.eiffel.com
			 Customer support http://support.eiffel.com
		]"




end -- class EV_ENVIRONMENT_IMP











