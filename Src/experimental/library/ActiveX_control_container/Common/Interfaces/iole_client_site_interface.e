note
	description: "Control interfaces. Help file: "
	legal: "See notice at end of class."
	status: "See notice at end of class."
	generator: "Automatically generated by the EiffelCOM Wizard."

deferred class
	IOLE_CLIENT_SITE_INTERFACE

inherit
	ECOM_INTERFACE

feature -- Status Report

	save_object_user_precondition: BOOLEAN
			-- User-defined preconditions for `save_object'.
			-- Redefine in descendants if needed.
		do
			Result := True
		end

	get_moniker_user_precondition (dw_assign: INTEGER; dw_which_moniker: INTEGER; ppmk: CELL [IMONIKER_INTERFACE]): BOOLEAN
			-- User-defined preconditions for `get_moniker'.
			-- Redefine in descendants if needed.
		do
			Result := True
		end

	get_container_user_precondition (pp_container: CELL [IOLE_CONTAINER_INTERFACE]): BOOLEAN
			-- User-defined preconditions for `get_container'.
			-- Redefine in descendants if needed.
		do
			Result := True
		end

	show_object_user_precondition: BOOLEAN
			-- User-defined preconditions for `show_object'.
			-- Redefine in descendants if needed.
		do
			Result := True
		end

	on_show_window_user_precondition (f_show: INTEGER): BOOLEAN
			-- User-defined preconditions for `on_show_window'.
			-- Redefine in descendants if needed.
		do
			Result := True
		end

	request_new_object_layout_user_precondition: BOOLEAN
			-- User-defined preconditions for `request_new_object_layout'.
			-- Redefine in descendants if needed.
		do
			Result := True
		end

feature -- Basic Operations

	save_object
			-- No description available.
		require
			save_object_user_precondition: save_object_user_precondition
		deferred

		end

	get_moniker (dw_assign: INTEGER; dw_which_moniker: INTEGER; ppmk: CELL [IMONIKER_INTERFACE])
			-- No description available.
			-- `dw_assign' [in].  
			-- `dw_which_moniker' [in].  
			-- `ppmk' [out].  
		require
			non_void_ppmk: ppmk /= Void
			get_moniker_user_precondition: get_moniker_user_precondition (dw_assign, dw_which_moniker, ppmk)
		deferred

		end

	get_container (pp_container: CELL [IOLE_CONTAINER_INTERFACE])
			-- No description available.
			-- `pp_container' [out].  
		require
			non_void_pp_container: pp_container /= Void
			get_container_user_precondition: get_container_user_precondition (pp_container)
		deferred

		ensure
			valid_pp_container: pp_container.item /= Void
		end

	show_object
			-- No description available.
		require
			show_object_user_precondition: show_object_user_precondition
		deferred

		end

	on_show_window (f_show: INTEGER)
			-- No description available.
			-- `f_show' [in].  
		require
			on_show_window_user_precondition: on_show_window_user_precondition (f_show)
		deferred

		end

	request_new_object_layout
			-- No description available.
		require
			request_new_object_layout_user_precondition: request_new_object_layout_user_precondition
		deferred

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




end -- IOLE_CLIENT_SITE_INTERFACE
