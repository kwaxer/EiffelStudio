note
	description: "Implemented `IPersist' Interface."
	legal: "See notice at end of class."
	status: "See notice at end of class."
	generator: "Automatically generated by the EiffelCOM Wizard."

class
	IPERSIST_IMPL_PROXY

inherit
	IPERSIST_INTERFACE

	ECOM_QUERIABLE

create
	make_from_other,
	make_from_pointer

feature {NONE}  -- Initialization

	make_from_pointer (cpp_obj: POINTER)
			-- Make from pointer
		do
			initializer := ccom_create_ipersist_impl_proxy_from_pointer(cpp_obj)
			item := ccom_item (initializer)
		end

feature -- Basic Operations

	get_class_id (p_class_id: ECOM_GUID)
			-- No description available.
			-- `p_class_id' [out].  
		do
			ccom_get_class_id (initializer, p_class_id.item)
		end

feature {NONE}  -- Implementation

	delete_wrapper
			-- Delete wrapper
		do
			ccom_delete_ipersist_impl_proxy(initializer)
		end

feature {NONE}  -- Externals

	ccom_get_class_id (cpp_obj: POINTER; p_class_id: POINTER)
			-- No description available.
		external
			"C++ [ecom_control_library::IPersist_impl_proxy %"ecom_control_library_IPersist_impl_proxy_s.h%"](GUID *)"
		end

	ccom_delete_ipersist_impl_proxy (a_pointer: POINTER)
			-- Release resource
		external
			"C++ [delete ecom_control_library::IPersist_impl_proxy %"ecom_control_library_IPersist_impl_proxy_s.h%"]()"
		end

	ccom_create_ipersist_impl_proxy_from_pointer (a_pointer: POINTER): POINTER
			-- Create from pointer
		external
			"C++ [new ecom_control_library::IPersist_impl_proxy %"ecom_control_library_IPersist_impl_proxy_s.h%"](IUnknown *)"
		end

	ccom_item (cpp_obj: POINTER): POINTER
			-- Item
		external
			"C++ [ecom_control_library::IPersist_impl_proxy %"ecom_control_library_IPersist_impl_proxy_s.h%"]():EIF_POINTER"
		end

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




end -- IPERSIST_IMPL_PROXY

