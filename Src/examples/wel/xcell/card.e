note
	legal: "See notice at end of class."
	status: "See notice at end of class."
class
	CARD

inherit
	ANY

	BASIC_ROUTINES
		export
			{NONE} all
		end

	GAME_CONSTANTS
		export
			{NONE} all
		end

	APP_CONSTANTS
		export
			{NONE} all
		end

create
	make

feature {NONE} -- Initialization

	make (number: INTEGER)
			-- Make the card identified by `number'.
		require
			number_greater_than_Card_offset: number > Card_offset
			number_less_or_equal_maximun: number <= Maximum_number_of_cards + Card_offset
		do
			create card_image.make_by_id (number)
			card_number := number
		ensure
			card_number_set: card_number = number
		end

feature -- Access

	card_image: WEL_BITMAP
			-- The image of the card

	card_number: INTEGER
			-- The number of the card

	offset_x: INTEGER
			-- Offset to the x-position of the mouse when
			-- moving a card

	offset_y: INTEGER
			-- Offset to the y-position off the mouse when
			-- moving a card

	x_position: INTEGER
			-- x_position of the card in the client-area

	y_position: INTEGER
			-- y_position of the card in the client-area

	width: INTEGER
			-- The width of the card
		do
			Result := card_image.width
		ensure
			positive_result: Result >= 0
		end

	height: INTEGER
			-- The height of the card
		do
			Result := card_image.height
		ensure
			positive_result: Result >= 0
		end

	set_offset_y (a_y: INTEGER)
			-- Set the `offset_y' to `a_y'
		do
			offset_y := a_y
		ensure
			offset_y_is_set: offset_y = a_y
		end

	set_offset_x (a_x: INTEGER)
			-- Set the `offset_x' to `a_x'
		do
			offset_x := a_x
		ensure
			offset_x_is_set: offset_x = a_x
		end

	set_x (a_x: INTEGER)
			-- Set the `x_position' to `a_y'
		do
			x_position := a_x
		ensure
			x_position_set: x_position = a_x
		end

	set_y (a_y: INTEGER)
			-- Set the `y_position' to `a_y'
		do
			y_position := a_y
		ensure
			y_position_set: y_position = a_y
		end

	includes_point (x_pos, y_pos: INTEGER): BOOLEAN
			-- Does the point defined by
			-- (x_pos, y_pos) is inside the image?
		do
			Result := x_pos > x_position
				and y_pos > y_position
				and x_pos < x_position + card_image.width
				and y_pos < y_position + card_image.height
		end

	overlapped_with (a_card: CARD): BOOLEAN
			-- Does 'a_card' overlap my image more than 50% horizontally?
		require
			a_card_not_void: a_card /= Void
		do
			Result := includes_point (a_card.x_position + (card_image.width // 2), a_card.y_position)
				or includes_point (a_card.x_position + (card_image.width // 2), a_card.y_position +
					card_image.height)
		end

invariant

	card_image_not_void: card_image /= Void
	card_image_exists: card_image.exists
	card_number_set: card_number /= 0

note
	copyright:	"Copyright (c) 1984-2006, Eiffel Software and others"
	license:	"Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			 Eiffel Software
			 356 Storke Road, Goleta, CA 93117 USA
			 Telephone 805-685-1006, Fax 805-685-6869
			 Website http://www.eiffel.com
			 Customer support http://support.eiffel.com
		]"


end -- class CARD

