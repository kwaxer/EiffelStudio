﻿note
	description: "Class for representing EDK Messages."
	date: "$Date$"
	revision: "$Revision$"

frozen class
	EDK_MESSAGE

inherit
	EDK_MESSAGE_SENDER

feature -- Access

	id: NATURAL_16
			-- Type ID of the message.
		do
			Result := c_native_message_id (native_message_handle).as_natural_16
			if Result & {EDK_MESSAGE_IDS}.edk_message_mask = {EDK_MESSAGE_IDS}.edk_message_mask then
					-- If an EDK event we need to filter out the meta information.
				Result := Result & {EDK_MESSAGE_IDS}.edk_message_id_mask
			end
		end

	time: NATURAL_32
			-- Event time for `Current'.
		do
			if not native then
				Result := native_time
			end
		end

	native: BOOLEAN
			-- Is `Current' generated by native toolkit?
		do
			Result := c_native_message_id (native_message_handle) & 0xFFFFC000 /= 0x00008000
		end

	user_generated: BOOLEAN
			-- Is `Current' generated by the user?
		do
			Result := c_native_message_id (native_message_handle) & 0xFFFFA000 = 0x0000A000
		end

	window: detachable NATIVE_WINDOW
			-- Window for which message is associated with.
		local
			l_native_window: POINTER
		do
			l_native_window := c_native_window_handle (native_message_handle)
			if
				l_native_window /= default_pointer and then
				attached {EDK_DESKTOP_EVENT_MANAGER} message_manager_cell.item as l_desktop_message_manager
			then
				Result := l_desktop_message_manager.window_from_window_handle (l_native_window)
			end
		end

	meta_flags: NATURAL_8
			-- Flags corresponding meta-information relating to the message type.
		do
			Result := ((c_native_message_id (native_message_handle) & 0x00001E00) |>> 0x9).as_natural_8
		end

	message_parameter_1: INTEGER_16
			-- 1st parameter for `Current'.
		do

		end

	message_parameter_2: INTEGER_16
			-- 2nd parameter for `Current'.
		do

		end

feature -- Status Setting

	set_window (a_window: detachable NATIVE_WINDOW)
			-- Set `window' to `a_window'
		local
			l_native_handle: POINTER
		do
			if a_window /= Void then
				l_native_handle := a_window.native_handle
			end
			c_set_native_window_handle (native_message_handle, l_native_handle)
		end

	set_time (a_time: NATURAL_32)
			-- Set time to `a_time'.
		do
			c_set_native_event_time (native_message_handle, a_time)
		end

	set_id (a_id: NATURAL_16)
			-- Set `id' to `a_id'.
			-- Wipes out any previous meta flags set for previous ID.
		local
			l_id: like a_id
		do
			l_id := a_id | {EDK_MESSAGE_IDS}.edk_user_message_mask
			c_set_native_message_id (native_message_handle, l_id)
		end

	set_meta_flags (a_meta_flags: NATURAL_8)
			-- Set meta flags for `Current' to `a_meta_flags'.
			-- Only 4 bits are allowed for metaflags
			-- ID for `Current' must be set first.
		require
			meta_flags_valid: a_meta_flags & 0xF = a_meta_flags
			not_native: not native
		local
			l_message_id: NATURAL_32
			l_flags: NATURAL_16
		do
			l_flags := a_meta_flags
				-- Bit shift to the left 11 places and AND with meta mask.
			l_flags := (l_flags |<< 0x9) | 0xE1FF
			l_message_id := c_native_message_id (native_message_handle) & l_flags

		end

	set_message_parameter_1 (a_message_parameter_1: INTEGER_16)
			-- Set `message_parameter_1' to `a_message_parameter_1'
		do
			c_set_native_message_parameter_1 (native_message_handle, integer_16_to_pointer (a_message_parameter_1))
		end

	set_message_parameter_2 (a_message_parameter_2: INTEGER_16)
			-- Set `message_parameter_2' to `a_message_parameter_2'
		do
			c_set_native_message_parameter_2 (native_message_handle, integer_16_to_pointer (a_message_parameter_2))
		end

feature -- Native Status Setting

	set_native_message_parameter_1 (a_message_parameter_1: POINTER)
			-- Set `native_message_parameter_1' to `a_message_parameter_1'
		do
			c_set_native_message_parameter_1 (native_message_handle, a_message_parameter_1)
		end

	set_native_message_parameter_2 (a_message_parameter_2: POINTER)
			-- Set `native_message_parameter_2' to `a_message_parameter_2'
		do
			c_set_native_message_parameter_2 (native_message_handle, a_message_parameter_2)
		end

feature -- Native Toolkit Access

	native_window_handle: POINTER
			-- Native Window Handle to which the message belongs to.
		do
			Result := c_native_window_handle (native_message_handle)
		end

	native_id: NATURAL_32
			-- Message Type ID that describes the message.
		do
			Result := c_native_message_id (native_message_handle)
		end

	native_message_parameter_1: POINTER
			-- Message Parameter 1 that describes meta data for message.
		do
			Result := c_native_message_parameter_1 (native_message_handle)
		end

	native_message_parameter_2: POINTER
			-- Message Parameter 2 that describes meta data for message.
		do
			Result := c_native_message_parameter_2 (native_message_handle)
		end

	native_time: NATURAL_32
			-- Time stamp of event.
		do
			Result := c_native_event_time (native_message_handle)
		end

feature {EDK_DISPLAY, EDK_MESSAGE_MANAGER} -- Implementation

	native_message_handle: POINTER
			-- Pointer to the native message structure.
		do
			if native_message_handle_internal = Result then
				native_message_handle_internal := Result.memory_calloc (1, c_native_event_structure_size)
			end
			Result := native_message_handle_internal
		end

	native_message_handle_internal: POINTER
		-- Pointer to the native message structure.

	native_reset_values
			-- Reset the values of `Current'.
		do
			if native_message_handle_internal /= default_pointer then
				c_native_message_reset (native_message_handle_internal)
			end
		end

feature {NONE} -- Implementation

	integer_16_to_pointer (a_integer_16: INTEGER_16): POINTER
		external
			"C inline"
		alias
			"return (EIF_POINTER) $a_integer_16;"
		end

	c_native_event_structure_size: INTEGER
			-- Memory size in byte of event structure
		external
			"C inline use <edk.h>"
		alias
			"[
				#ifdef EIF_OS = EIF_WINNT
					return sizeof (MSG);
				#endif
			]"
		end

	c_native_event_time (a_native_message_handle: POINTER): NATURAL_32
		external
			"C inline use <edk.h>"
		alias
			"[
				#ifdef EIF_OS = EIF_WINNT
					return ((MSG*) $a_native_message_handle)->time;
				#endif
			]"
		end

	c_set_native_event_time (a_native_message_handle: POINTER; a_time: NATURAL_32)
		external
			"C inline use <edk.h>"
		alias
			"[
				#ifdef EIF_OS = EIF_WINNT
					((MSG*) $a_native_message_handle)->time = (DWORD) $a_time;
				#endif
			]"
		end

	c_native_window_handle (a_native_message_handle: POINTER): POINTER
			-- Retrieve the native window handle from `a_native_message_handle'.
		external
			"C inline use <edk.h>"
		alias
			"[
				#ifdef EIF_OS = EIF_WINNT
					return ((MSG*) $a_native_message_handle)->hwnd;
				#endif
			]"
		end

	c_set_native_window_handle (a_native_message_handle: POINTER; a_native_window_handle: POINTER)
			-- Set the native window handle to `a_native_message_handle'.
		external
			"C inline use <edk.h>"
		alias
			"[
				#ifdef EIF_OS = EIF_WINNT
					((MSG*) $a_native_message_handle)->hwnd = (HWND) $a_native_window_handle;
				#endif
			]"
		end

	c_native_message_id (a_native_message_handle: POINTER): NATURAL_32
			-- Retrieve the native message_type from `a_native_message_handle'.
		external
			"C inline use <edk.h>"
		alias
			"[
				#ifdef EIF_OS = EIF_WINNT
					return ((MSG*) $a_native_message_handle)->message;
				#endif
			]"
		end

	c_set_native_message_id (a_native_message_handle: POINTER; a_message_type: NATURAL_32)
			-- Set the native message_type to `a_native_message_handle'.
		external
			"C inline use <edk.h>"
		alias
			"[
				#ifdef EIF_OS = EIF_WINNT
					((MSG*) $a_native_message_handle)->message = (UINT) $a_message_type;
				#endif
			]"
		end

	c_native_message_parameter_1 (a_native_message_handle: POINTER): POINTER
			-- Retrieve the native message parameter 1 from `a_native_message_handle'.
		external
			"C inline use <edk.h>"
		alias
			"[
				#ifdef EIF_OS = EIF_WINNT
					return ((MSG*) $a_native_message_handle)->wParam;
				#endif
			]"
		end

	c_set_native_message_parameter_1 (a_native_message_handle: POINTER; a_message_parameter_1: POINTER)
			-- Set the native message parameter 1 to `a_native_message_handle'.
		external
			"C inline use <edk.h>"
		alias
			"[
				#ifdef EIF_OS = EIF_WINNT
					((MSG*) $a_native_message_handle)->wParam = (WPARAM) $a_message_parameter_1;
				#endif
			]"
		end

	c_native_message_parameter_2 (a_native_message_handle: POINTER): POINTER
			-- Retrieve the native message parameter 2 from `a_native_message_handle'.
		external
			"C inline use <edk.h>"
		alias
			"[
				#ifdef EIF_OS = EIF_WINNT
					return ((MSG*) $a_native_message_handle)->lParam;
				#endif
			]"
		end

	c_set_native_message_parameter_2 (a_native_message_handle: POINTER; a_message_parameter_2: POINTER)
			-- Set the native message parameter 2 to `a_native_message_handle'.
		external
			"C inline use <edk.h>"
		alias
			"[
				#ifdef EIF_OS = EIF_WINNT
					((MSG*) $a_native_message_handle)->lParam = (LPARAM) $a_message_parameter_2;
				#endif
			]"
		end

	c_native_message_reset (a_native_message_handle: POINTER)
			-- Reset the native message handle to its default values.
		external
			"C inline use <edk.h>"
		alias
			"[
				#ifdef EIF_OS = EIF_WINNT
					ZeroMemory ($a_native_message_handle, sizeof (MSG));
				#endif
			]"
		end

	dispose
			-- Clean up message handle
		do
			if native_message_handle_internal /= default_pointer then
				native_message_handle_internal.memory_free
			end
		end

note
	copyright: "Copyright (c) 1984-2018, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"
end
