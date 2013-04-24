note
	description: "Implemented `IPropertyBag' Interface."
	legal: "See notice at end of class."
	status: "See notice at end of class."
	generator: "Automatically generated by the EiffelCOM Wizard."

class
	IPROPERTY_BAG_IMPL_PROXY

inherit
	IPROPERTY_BAG_INTERFACE

	ECOM_QUERIABLE

create
	make_from_other,
	make_from_pointer

feature {NONE}  -- Initialization

	make_from_pointer (cpp_obj: POINTER)
			-- Make from pointer
		do
			initializer := ccom_create_iproperty_bag_impl_proxy_from_pointer(cpp_obj)
			item := ccom_item (initializer)
		end

feature -- Basic Operations

	read (psz_prop_name: STRING; p_var: ECOM_VARIANT; p_error_log: IERROR_LOG_INTERFACE)
			-- No description available.
			-- `psz_prop_name' [in].  
			-- `p_var' [out].  
			-- `p_error_log' [in].  
		local
			p_error_log_item: POINTER
			a_stub: ECOM_STUB
		do
			if p_error_log /= Void then
				if (p_error_log.item = default_pointer) then
					a_stub ?= p_error_log
					if a_stub /= Void then
						a_stub.create_item
					end
				end
				p_error_log_item := p_error_log.item
			end
			ccom_read (initializer, psz_prop_name, p_var.item, p_error_log_item)
		end

	write (psz_prop_name: STRING; p_var: ECOM_VARIANT)
			-- No description available.
			-- `psz_prop_name' [in].  
			-- `p_var' [in].  
		do
			ccom_write (initializer, psz_prop_name, p_var.item)
		end

feature {NONE}  -- Implementation

	delete_wrapper
			-- Delete wrapper
		do
			ccom_delete_iproperty_bag_impl_proxy(initializer)
		end

feature {NONE}  -- Externals

	ccom_read (cpp_obj: POINTER; psz_prop_name: STRING; p_var: POINTER; p_error_log: POINTER)
			-- No description available.
		external
			"C++ [ecom_control_library::IPropertyBag_impl_proxy %"ecom_control_library_IPropertyBag_impl_proxy_s.h%"](EIF_OBJECT,VARIANT *,::IErrorLog *)"
		end

	ccom_write (cpp_obj: POINTER; psz_prop_name: STRING; p_var: POINTER)
			-- No description available.
		external
			"C++ [ecom_control_library::IPropertyBag_impl_proxy %"ecom_control_library_IPropertyBag_impl_proxy_s.h%"](EIF_OBJECT,VARIANT *)"
		end

	ccom_delete_iproperty_bag_impl_proxy (a_pointer: POINTER)
			-- Release resource
		external
			"C++ [delete ecom_control_library::IPropertyBag_impl_proxy %"ecom_control_library_IPropertyBag_impl_proxy_s.h%"]()"
		end

	ccom_create_iproperty_bag_impl_proxy_from_pointer (a_pointer: POINTER): POINTER
			-- Create from pointer
		external
			"C++ [new ecom_control_library::IPropertyBag_impl_proxy %"ecom_control_library_IPropertyBag_impl_proxy_s.h%"](IUnknown *)"
		end

	ccom_item (cpp_obj: POINTER): POINTER
			-- Item
		external
			"C++ [ecom_control_library::IPropertyBag_impl_proxy %"ecom_control_library_IPropertyBag_impl_proxy_s.h%"]():EIF_POINTER"
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




end -- IPROPERTY_BAG_IMPL_PROXY

