class
	TEST1 [G, H, K]

create
	make

feature

	make
		local
			p: PROCEDURE [K]
			l_node: K
		do
			p.call ([l_node])
		end
end
