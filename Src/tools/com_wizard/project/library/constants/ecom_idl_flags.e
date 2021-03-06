note
	description: "COM IDLFLAGS flags"
	legal: "See notice at end of class."
	status: "See notice at end of class.";
	date: "$Date$";
	revision: "$Revision$"

class
	ECOM_IDL_FLAGS

inherit
	ECOM_FLAGS
	
feature -- Access

	Idlflag_none: INTEGER
			-- Whether the parameter passes or receives information is unspecified
		external
			"C [macro <oaidl.h>]"
		alias
			"IDLFLAG_NONE"
		end

	Idlflag_fin: INTEGER
			-- Parameter passes information from the caller to the callee
		external
			"C [macro <oaidl.h>]"
		alias
			"IDLFLAG_FIN"
		end

	Idlflag_fout: INTEGER
			--  Parameter returns information from the callee to the caller
		external
			"C [macro <oaidl.h>]"
		alias
			"IDLFLAG_FOUT"
		end
			
	Idlflag_flcid: INTEGER
			-- Parameter is the LCID of a client application
		external
			"C [macro <oaidl.h>]"
		alias
			"IDLFLAG_FLCID"
		end

	Idlflag_fretval: INTEGER
			-- Parameter is the return value of the member
		external
			"C [macro <oaidl.h>]"
		alias
			"IDLFLAG_FRETVAL"
		end

feature -- Status report

	is_idlflag_none (flag: INTEGER): BOOLEAN
			-- Is flag IDLFLAG_NONE?
		do
			Result := flag = Idlflag_none
		end

	is_idlflag_fin (flag: INTEGER): BOOLEAN
			-- Is `in' parameter?
		do
			Result := binary_and (flag, Idlflag_fin) = Idlflag_fin
		end

	is_idlflag_fout (flag: INTEGER): BOOLEAN
			-- Is `out' parameter?
		do
			Result := binary_and (flag, Idlflag_fout) = Idlflag_fout
		end

	is_idlflag_flcid (flag: INTEGER): BOOLEAN
			-- Is `lcid' parameter?
		do
			Result := binary_and (flag, Idlflag_flcid) = Idlflag_flcid
		end

	is_idlflag_fretval (flag: INTEGER): BOOLEAN
			-- Is `retval' parameter?
		do
			Result := binary_and (flag, Idlflag_fretval) = Idlflag_fretval
		end

	is_valid_idlflag (flag: INTEGER): BOOLEAN
			-- Is `flag' a valid combination of idlflags?
		do
			Result := is_idlflag_none (flag) or
						is_idlflag_fin (flag) or
						is_idlflag_fout (flag) or
						is_idlflag_flcid (flag) or
						is_idlflag_fretval (flag)
		end

note
	copyright:	"Copyright (c) 1984-2006, Eiffel Software"
	license:	"GPL version 2 (see http://www.eiffel.com/licensing/gpl.txt)"
	licensing_options:	"http://www.eiffel.com/licensing"
	copying: "[
			This file is part of Eiffel Software's Eiffel Development Environment.
			
			Eiffel Software's Eiffel Development Environment is free
			software; you can redistribute it and/or modify it under
			the terms of the GNU General Public License as published
			by the Free Software Foundation, version 2 of the License
			(available at the URL listed under "license" above).
			
			Eiffel Software's Eiffel Development Environment is
			distributed in the hope that it will be useful,	but
			WITHOUT ANY WARRANTY; without even the implied warranty
			of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
			See the	GNU General Public License for more details.
			
			You should have received a copy of the GNU General Public
			License along with Eiffel Software's Eiffel Development
			Environment; if not, write to the Free Software Foundation,
			Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301  USA
		]"
	source: "[
			 Eiffel Software
			 356 Storke Road, Goleta, CA 93117 USA
			 Telephone 805-685-1006, Fax 805-685-6869
			 Website http://www.eiffel.com
			 Customer support http://support.eiffel.com
		]"
end -- class ECOM_IDL_FLAGS


