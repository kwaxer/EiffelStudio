indexing

	description: 
		"Error when invalid file name in C/Object file name list.";
	date: "$Date$";
	revision: "$Revision $"

class VD17

inherit

	LACE_ERROR
		redefine
			build_explain
		end

feature -- Properties

	file_name: ID_SD;
			-- File name involved

	file_name_list: LACE_LIST [ID_SD];
			-- File name list

feature -- Output

	build_explain (ow: OUTPUT_WINDOW) is
		do
			ow.put_string ("Cluster path: ");
-- FIXME
			ow.put_string ("FIX ME!");
			ow.new_line
		end;

feature {NONE} -- Setting

	set_file_name (fn: ID_SD) is
			-- Assign `fn' to `file_name'.
		do
			file_name := fn;
		end;

	set_file_name_list (l: like file_name_list) is
			-- Assign `l' to `file_name_list'.
		do
			file_name_list := l;
		end;

end -- class VD17
