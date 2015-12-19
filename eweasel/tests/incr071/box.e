note

	description:
		"Data structures of the most general kind, %
		%having the potential ability to become full, %
		%and characterized by their implementation properties.";

	status: "See notice at end of class";
	names: storage;
	date: "$Date$";
	revision: "$Revision$"

deferred class BOX [G] inherit

	CONTAINER [G]

feature -- Status report

	full: BOOLEAN
			-- Is structure filled to capacity?
		deferred
		end;

end -- class BOX


--|----------------------------------------------------------------
--| EiffelBase: Library of reusable components for Eiffel.
--| Copyright (c) 1993-2006 University of Southern California and contributors.
--| For ISE customers the original versions are an ISE product
--| covered by the ISE Eiffel license and support agreements.
--| EiffelBase may now be used by anyone as FREE SOFTWARE to
--| develop any product, public-domain or commercial, without
--| payment to ISE, under the terms of the ISE Free Eiffel Library
--| License (IFELL) at http://eiffel.com/products/base/license.html.
--|
--| Interactive Software Engineering Inc.
--| ISE Building, 2nd floor
--| 270 Storke Road, Goleta, CA 93117 USA
--| Telephone 805-685-1006, Fax 805-685-6869
--| Electronic mail <info@eiffel.com>
--| Customer support e-mail <support@eiffel.com>
--| For latest info see award-winning pages: http://eiffel.com
--|----------------------------------------------------------------

