indexing
	description:
		"Action sequences for EV_HEADER_IMP."
	date: "$date"
	revision: "$revision"

deferred class
	 EV_HEADER_ACTION_SEQUENCES_IMP

inherit
	EV_HEADER_ACTION_SEQUENCES_I
	
feature {NONE} -- Implementation
	
	create_item_resize_actions: EV_HEADER_ITEM_ACTION_SEQUENCE is
			-- Create an item resize actions.
		do
			create Result
		end
		
	create_item_resize_start_actions: EV_HEADER_ITEM_ACTION_SEQUENCE is
			-- Create an item resize start actions.
		do
			create Result
		end
		
	create_item_resize_end_actions: EV_HEADER_ITEM_ACTION_SEQUENCE is
			-- Create an item resize end actions.
		do
			create Result
		end

end

--|----------------------------------------------------------------
--| EiffelVision2: library of reusable components for ISE Eiffel.
--| Copyright (C) 1985-2004 Eiffel Software. All rights reserved.
--| Duplication and distribution prohibited.  May be used only with
--| ISE Eiffel, under terms of user license.
--| Contact Eiffel Software for any other use.
--|
--| Interactive Software Engineering Inc.
--| dba Eiffel Software
--| 356 Storke Road, Goleta, CA 93117 USA
--| Telephone 805-685-1006, Fax 805-685-6869
--| Contact us at: http://www.eiffel.com/general/email.html
--| Customer support: http://support.eiffel.com
--| For latest info on our award winning products, visit:
--|	http://www.eiffel.com
--|----------------------------------------------------------------

