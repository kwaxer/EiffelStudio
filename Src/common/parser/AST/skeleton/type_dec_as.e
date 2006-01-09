indexing
	description:
		"Abstract description of a type declaration. %
		%Version for Bench."
	date: "$Date$"
	revision: "$Revision$"

class TYPE_DEC_AS

inherit
	AST_EIFFEL
		redefine
			is_equivalent
		end

	SHARED_NAMES_HEAP

create
	initialize

feature {NONE} -- Initialization

	initialize (i: like id_list; t: like type; c_as, s_as: SYMBOL_AS) is
			-- Create a new TYPE_DEC AST node.
		require
			i_not_void: i /= Void
			t_not_void: t /= Void
		do
			id_list := i
			type := t
			colon_symbol := c_as
			semicolon_symbol := s_as
		ensure
			id_list_set: id_list = i
			type_set: type = t
			colon_symbol_set: colon_symbol = c_as
			semicolon_symbol_set: semicolon_symbol = s_as
		end

feature -- Visitor

	process (v: AST_VISITOR) is
			-- process current element.
		do
			v.process_type_dec_as (Current)
		end

feature -- Roundtrip

	colon_symbol: SYMBOL_AS
		-- Symbol colon associated with this structure

	semicolon_symbol: SYMBOL_AS
		-- Symbol semicolon associated with this structure

feature -- Access

	id_list: CONSTRUCT_LIST [INTEGER]
			-- List of ids

	type: TYPE_AS
			-- Type

	item_name (i: INTEGER): STRING is
			-- Name of `id' at position `i'.
		require
			valid_index: id_list.valid_index (i)
		do
			Result := Names_heap.item (id_list.i_th (i))
		ensure
			Result_not_void: Result /= Void
			Result_not_empty: not Result.is_empty
		end

feature -- Roundtrip

	complete_start_location (a_list: LEAF_AS_LIST): LOCATION_AS is
		local
			l_id_list: IDENTIFIER_LIST
		do
			if a_list = Void then
				Result := type.complete_start_location (a_list)
			else
				l_id_list ?= id_list
				Result := l_id_list.id_list.complete_start_location (a_list)
			end
		end

	complete_end_location (a_list: LEAF_AS_LIST): LOCATION_AS is
		do
			Result := type.complete_end_location (a_list)
		end

feature -- Comparison

	is_equivalent (other: like Current): BOOLEAN is
			-- Is `other' equivalent to the current object ?
		do
			Result := equal (id_list, other.id_list) and then
				equivalent (type, other.type)
		end

feature {TYPE_DEC_AS, LOCALS_MERGER} -- Replication

	set_type (t: like type) is
		require
			valid_t: t /= Void
		do
			type := t
		end;

	set_id_list (id: like id_list) is
		require
			valid_t: id /= Void
		do
			id_list := id
		end;

invariant
	type_not_void: type /= Void
	id_list_not_void: id_list /= Void

end -- class TYPE_DEC_AS
