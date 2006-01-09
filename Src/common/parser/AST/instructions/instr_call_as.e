indexing
	description: "Abstract description of a call as an instruction, %
				%Version for Bench."
	date: "$Date$"
	revision: "$Revision$"

class
	INSTR_CALL_AS

inherit
	INSTRUCTION_AS
		redefine
			starts_with_parenthesis
		end

create
	initialize

feature {NONE} -- Initialization

	initialize (c: like call) is
			-- Create a new INSTR_CALL AST node.
		require
			c_not_void: c /= Void
		do
			call := c
		ensure
			call_set: call = c
		end

feature -- Visitor

	process (v: AST_VISITOR) is
			-- process current element.
		do
			v.process_instr_call_as (Current)
		end

feature -- Attributes

	call: CALL_AS
			-- Call instruction

feature -- Roundtrip

	complete_start_location (a_list: LEAF_AS_LIST): LOCATION_AS is
		do
			Result := call.complete_start_location (a_list)
		end

	complete_end_location (a_list: LEAF_AS_LIST): LOCATION_AS is
		do
			Result := call.complete_end_location (a_list)
		end

feature -- Comparison

	is_equivalent (other: like Current): BOOLEAN is
			-- Is `other' equivalent to the current object ?
		do
			Result := equivalent (call, other.call)
		end

feature {INTERNAL_AS} -- Status report

	starts_with_parenthesis: BOOLEAN is
			-- Is the first format item a "(".
			-- See: AST_FORMATTER_VISITOR.format_compound.
		local
			nested: NESTED_EXPR_AS
		do
			nested ?= call
			Result := nested /= Void
		end

invariant
	call_not_void: call /= Void

end -- class INSTR_CALL_AS
