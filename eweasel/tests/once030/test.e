
class TEST

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		local
			b: B
		do
			create b.make2
		end


end
