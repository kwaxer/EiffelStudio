note 
	status: "See notice at end of class."; 
	date: "$Date$"; 
	revision: "$Revision$" 
 
class
	INTEGER_GENERATOR_WINDOWS

create
        make

feature -- Initialization

        make (a_minimum,a_maximum: INTEGER)
			-- Make the generator.
                do
                        minimum := a_minimum
                        maximum := a_maximum
                        value := minimum
                ensure
                        minimum_set: minimum = a_minimum
                        maximum_set: maximum = a_maximum
                        value_is_minimum: value = minimum
                end

feature -- Access

        maximum: INTEGER
                    -- Largest possible value for generator

        minimum: INTEGER
                    -- Smallest possible value for generator

        value: INTEGER
                    -- Current value of generator

feature -- Status setting

        next
                do
                        value := value + 1
                        if value > maximum then value := minimum end
                ensure
                        old value = maximum implies value = minimum
                        old value /= maximum implies value = old value + 1
                end

        reset
                do
                        value := minimum
                ensure
                        value = minimum
                end

        set_value (a_value: INTEGER)
                require
                        in_range: minimum <= a_value and then a_value <= maximum
                do
                        value := a_value
                ensure
                        value = a_value
                end

invariant

        minimal: minimum <= value
        maximal: value <= maximum

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




end -- class INTEGER_GENERATOR

