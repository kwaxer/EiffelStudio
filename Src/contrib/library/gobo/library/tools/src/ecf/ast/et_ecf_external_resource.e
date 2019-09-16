note

	description:

		"ECF external resources"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ECF_EXTERNAL_RESOURCE

inherit

	ET_ECF_EXTERNAL_PATHNAME
		rename
			fill_external_values as fill_external_resources
		end

create

	make

feature {NONE} -- Implementation

	add_external_value (a_value: STRING; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Add `a_value' to `a_universe.current_system'.
		do
			a_universe.current_system.external_resource_pathnames.force_last (a_value)
		end

end
