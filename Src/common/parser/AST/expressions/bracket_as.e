indexing
	description: "Bracket expression node."
	date: "$Date$"
	revision: "$Revision$"

class
	BRACKET_AS

inherit
	EXPR_AS

create
	make

feature {NONE} -- Creation

	make (t: like target; o: like operands; l_as, r_as: like lbracket_symbol) is
			-- Create bracket expression with target `t' and operands `o'.
		require
			t_not_void: t /= Void
			o_not_void: o /= Void
			o_not_empty: not o.is_empty
		do
			target := t
			operands :=  o
			lbracket_symbol := l_as
			rbracket_symbol := r_as
		ensure
			target_set: target = t
			operands_set: operands = o
			lbracket_symbol_set: lbracket_symbol = l_as
			rbracket_symbol_set: rbracket_symbol = r_as
		end

feature -- Roundtrip

	lbracket_symbol, rbracket_symbol: SYMBOL_AS
			-- Symbol "[" and "]" associated with this structure

feature -- Access

	target: EXPR_AS
			-- Target of bracket expression

	operands: EIFFEL_LIST [EXPR_AS]
			-- Operands of bracket expression

feature -- Location

	left_bracket_location: LOCATION_AS is
			-- Location of a left bracket
		do
			Result := operands.first.start_location
		end

feature -- Roundtrip/Location

	complete_start_location (a_list: LEAF_AS_LIST): LOCATION_AS is
		do
			Result := target.complete_start_location (a_list)
		end

	complete_end_location (a_list: LEAF_AS_LIST): LOCATION_AS is
		do
			if a_list = Void then
				Result := operands.complete_end_location (a_list)
			else
				Result := rbracket_symbol.complete_end_location (a_list)
			end
		end

feature -- Comparison

	is_equivalent (other: like Current): BOOLEAN is
			-- Is `other' equivalent to the current object ?
		do
			Result := equivalent (target, other.target) and then
				equivalent (operands, other.operands)
		end

feature -- Visitor

	process (v: AST_VISITOR) is
			-- Process current element.
		do
			v.process_bracket_as (Current)
		end

invariant
	target_not_void: target /= Void
	operands_not_void: operands /= Void
	operands_not_empty: not operands.is_empty

end
