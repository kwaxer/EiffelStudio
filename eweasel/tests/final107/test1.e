class TEST1 [G -> ANY]

create
	make

feature

	make
		local
			a: ANY
		do
			create internal
			a := internal.dup (x)
		end

	x: G
		do
		end

	internal: TEST2
	
end
