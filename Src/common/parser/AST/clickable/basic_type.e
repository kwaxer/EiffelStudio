indexing

	description: 
		"AST representation of an Eiffel basic type.";
	date: "$Date$";
	revision: "$Revision$"

deferred class BASIC_TYPE

inherit

	TYPE;
	CLICKABLE_AST
		redefine
			is_class
		end			

feature {NONE} -- Initialization

	set is
			-- Yacc initialization
		do
			-- Do nothing
		end;

feature -- Properties

	is_class: BOOLEAN is
			-- Does the Current AST represent a class?
		do
			Result := True
		end;

end -- class BASIC_TYPE
