-- This file has been generated by EWG. Do not edit. Changes will be lost!
-- functions wrapper
class EVENTS_FUNCTIONS

obsolete
	"Use class EVENTS_FUNCTIONS_EXTERNAL instead."

inherit

	EVENTS_FUNCTIONS_EXTERNAL

feature
	get_mouse (mouseloc: POINTER) is
		local
		do
			get_mouse_external (mouseloc)
		end

	button: INTEGER is
		local
		do
			Result := button_external
		end

	still_down: INTEGER is
		local
		do
			Result := still_down_external
		end

	wait_mouse_up: INTEGER is
		local
		do
			Result := wait_mouse_up_external
		end

	key_translate (transdata: POINTER; keycode: INTEGER; state: POINTER): INTEGER is
		local
		do
			Result := key_translate_external (transdata, keycode, state)
		end

	get_caret_time: INTEGER is
		local
		do
			Result := get_caret_time_external
		end

	get_keys (thekeys: POINTER) is
		local
		do
			get_keys_external (thekeys)
		end

	get_dbl_time: INTEGER is
		local
		do
			Result := get_dbl_time_external
		end

	set_event_mask (value: INTEGER) is
		local
		do
			set_event_mask_external (value)
		end

	get_next_event (eventmask: INTEGER; theevent: POINTER): INTEGER is
		local
		do
			Result := get_next_event_external (eventmask, theevent)
		end

	wait_next_event (eventmask: INTEGER; theevent: POINTER; sleep: INTEGER; mousergn: POINTER): INTEGER is
		local
		do
			Result := wait_next_event_external (eventmask, theevent, sleep, mousergn)
		end

	event_avail (eventmask: INTEGER; theevent: POINTER): INTEGER is
		local
		do
			Result := event_avail_external (eventmask, theevent)
		end

	post_event (eventnum: INTEGER; eventmsg: INTEGER): INTEGER is
		local
		do
			Result := post_event_external (eventnum, eventmsg)
		end

	flush_events (whichmask: INTEGER; stopmask: INTEGER) is
		local
		do
			flush_events_external (whichmask, stopmask)
		end

	get_global_mouse (globalmouse: POINTER) is
		local
		do
			get_global_mouse_external (globalmouse)
		end

	get_current_key_modifiers: INTEGER is
		local
		do
			Result := get_current_key_modifiers_external
		end

	check_event_queue_for_user_cancel: INTEGER is
		local
		do
			Result := check_event_queue_for_user_cancel_external
		end

	key_script (code: INTEGER) is
		local
		do
			key_script_external (code)
		end

	is_cmd_char (event: POINTER; test: INTEGER): INTEGER is
		local
		do
			Result := is_cmd_char_external (event, test)
		end

	lmget_key_thresh: INTEGER is
		local
		do
			Result := lmget_key_thresh_external
		end

	lmset_key_thresh (value: INTEGER) is
		local
		do
			lmset_key_thresh_external (value)
		end

	lmget_key_rep_thresh: INTEGER is
		local
		do
			Result := lmget_key_rep_thresh_external
		end

	lmset_key_rep_thresh (value: INTEGER) is
		local
		do
			lmset_key_rep_thresh_external (value)
		end

	lmget_kbd_last: INTEGER is
		local
		do
			Result := lmget_kbd_last_external
		end

	lmset_kbd_last (value: INTEGER) is
		local
		do
			lmset_kbd_last_external (value)
		end

	lmget_kbd_type: INTEGER is
		local
		do
			Result := lmget_kbd_type_external
		end

	lmset_kbd_type (value: INTEGER) is
		local
		do
			lmset_kbd_type_external (value)
		end

end
