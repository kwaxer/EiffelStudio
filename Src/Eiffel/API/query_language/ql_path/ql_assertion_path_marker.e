note
	description: "Path marker for assertion item used in Eiffel Query Language"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	QL_ASSERTION_PATH_MARKER

inherit
	QL_PATH_MARKER
		redefine
			path_name
		end

create
	make

feature -- Access

	path_name (a_base_name: READABLE_STRING_GENERAL): STRING_32
			-- Path name of `a_base_name'
		do
			create Result.make (a_base_name.count + opener.count + closer.count)
			if not opener.is_empty then
				Result.append (opener)
			end
			if a_base_name.is_empty then
				Result.append (empty_assertion_name)
			else
				Result.append_string_general (a_base_name)
			end
			if not closer.is_empty then
				Result.append (closer)
			end
		end

	empty_assertion_name: STRING_32 = "%"%"";
			-- Virtual name for an assertion without tag

note
	copyright: "Copyright (c) 1984-2013, Eiffel Software"
	license: "GPL version 2 (see http://www.eiffel.com/licensing/gpl.txt)"
	licensing_options: "http://www.eiffel.com/licensing"
	copying: "[
			This file is part of Eiffel Software's Eiffel Development Environment.
			
			Eiffel Software's Eiffel Development Environment is free
			software; you can redistribute it and/or modify it under
			the terms of the GNU General Public License as published
			by the Free Software Foundation, version 2 of the License
			(available at the URL listed under "license" above).
			
			Eiffel Software's Eiffel Development Environment is
			distributed in the hope that it will be useful, but
			WITHOUT ANY WARRANTY; without even the implied warranty
			of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
			See the GNU General Public License for more details.
			
			You should have received a copy of the GNU General Public
			License along with Eiffel Software's Eiffel Development
			Environment; if not, write to the Free Software Foundation,
			Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
		]"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
