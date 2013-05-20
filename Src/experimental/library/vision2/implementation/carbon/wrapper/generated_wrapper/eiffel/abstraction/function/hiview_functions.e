-- This file has been generated by EWG. Do not edit. Changes will be lost!
-- functions wrapper
class HIVIEW_FUNCTIONS

obsolete
	"Use class HIVIEW_FUNCTIONS_EXTERNAL instead."

inherit

	HIVIEW_FUNCTIONS_EXTERNAL

feature
	hiview_get_root (inwindow: POINTER): POINTER is
		local
		do
			Result := hiview_get_root_external (inwindow)
		end

	hiview_add_subview (inparent: POINTER; innewchild: POINTER): INTEGER is
		local
		do
			Result := hiview_add_subview_external (inparent, innewchild)
		end

	hiview_remove_from_superview (inview: POINTER): INTEGER is
		local
		do
			Result := hiview_remove_from_superview_external (inview)
		end

	hiview_get_superview (inview: POINTER): POINTER is
		local
		do
			Result := hiview_get_superview_external (inview)
		end

	hiview_get_first_subview (inview: POINTER): POINTER is
		local
		do
			Result := hiview_get_first_subview_external (inview)
		end

	hiview_get_last_subview (inview: POINTER): POINTER is
		local
		do
			Result := hiview_get_last_subview_external (inview)
		end

	hiview_get_next_view (inview: POINTER): POINTER is
		local
		do
			Result := hiview_get_next_view_external (inview)
		end

	hiview_get_previous_view (inview: POINTER): POINTER is
		local
		do
			Result := hiview_get_previous_view_external (inview)
		end

	hiview_count_subviews (inview: POINTER): INTEGER is
		local
		do
			Result := hiview_count_subviews_external (inview)
		end

	hiview_get_indexed_subview (inview: POINTER; insubviewindex: INTEGER; outsubview: POINTER): INTEGER is
		local
		do
			Result := hiview_get_indexed_subview_external (inview, insubviewindex, outsubview)
		end

	hiview_set_zorder (inview: POINTER; inop: INTEGER; inother: POINTER): INTEGER is
		local
		do
			Result := hiview_set_zorder_external (inview, inop, inother)
		end

	hiview_set_visible (inview: POINTER; invisible: INTEGER): INTEGER is
		local
		do
			Result := hiview_set_visible_external (inview, invisible)
		end

	hiview_is_visible (inview: POINTER): INTEGER is
		local
		do
			Result := hiview_is_visible_external (inview)
		end

	hiview_is_latently_visible (inview: POINTER): INTEGER is
		local
		do
			Result := hiview_is_latently_visible_external (inview)
		end

	hiview_set_hilite (inview: POINTER; inhilitepart: INTEGER): INTEGER is
		local
		do
			Result := hiview_set_hilite_external (inview, inhilitepart)
		end

	hiview_is_active (inview: POINTER; outislatentactive: STRING): INTEGER is
		local
			outislatentactive_c_string: EWG_ZERO_TERMINATED_STRING
		do
			create outislatentactive_c_string.make_shared_from_string (outislatentactive)
			Result := hiview_is_active_external (inview, outislatentactive_c_string.item)
		end

	hiview_set_activated (inview: POINTER; insetactivated: INTEGER): INTEGER is
		local
		do
			Result := hiview_set_activated_external (inview, insetactivated)
		end

	hiview_is_enabled (inview: POINTER; outislatentenabled: STRING): INTEGER is
		local
			outislatentenabled_c_string: EWG_ZERO_TERMINATED_STRING
		do
			create outislatentenabled_c_string.make_shared_from_string (outislatentenabled)
			Result := hiview_is_enabled_external (inview, outislatentenabled_c_string.item)
		end

	hiview_set_enabled (inview: POINTER; insetenabled: INTEGER): INTEGER is
		local
		do
			Result := hiview_set_enabled_external (inview, insetenabled)
		end

	hiview_is_compositing_enabled (inview: POINTER): INTEGER is
		local
		do
			Result := hiview_is_compositing_enabled_external (inview)
		end

	hiview_set_text (inview: POINTER; intext: POINTER): INTEGER is
		local
		do
			Result := hiview_set_text_external (inview, intext)
		end

	hiview_copy_text (inview: POINTER): POINTER is
		local
		do
			Result := hiview_copy_text_external (inview)
		end

	hiview_get_value (inview: POINTER): INTEGER is
		local
		do
			Result := hiview_get_value_external (inview)
		end

	hiview_set_value (inview: POINTER; invalue: INTEGER): INTEGER is
		local
		do
			Result := hiview_set_value_external (inview, invalue)
		end

	hiview_get_minimum (inview: POINTER): INTEGER is
		local
		do
			Result := hiview_get_minimum_external (inview)
		end

	hiview_set_minimum (inview: POINTER; inminimum: INTEGER): INTEGER is
		local
		do
			Result := hiview_set_minimum_external (inview, inminimum)
		end

	hiview_get_maximum (inview: POINTER): INTEGER is
		local
		do
			Result := hiview_get_maximum_external (inview)
		end

	hiview_set_maximum (inview: POINTER; inmaximum: INTEGER): INTEGER is
		local
		do
			Result := hiview_set_maximum_external (inview, inmaximum)
		end

	hiview_get_view_size (inview: POINTER): INTEGER is
		local
		do
			Result := hiview_get_view_size_external (inview)
		end

	hiview_set_view_size (inview: POINTER; inviewsize: INTEGER): INTEGER is
		local
		do
			Result := hiview_set_view_size_external (inview, inviewsize)
		end

	hiview_is_valid (inview: POINTER): INTEGER is
		local
		do
			Result := hiview_is_valid_external (inview)
		end

	hiview_set_id (inview: POINTER; inid: POINTER): INTEGER is
		local
		do
			Result := hiview_set_id_external (inview, inid)
		end

	hiview_get_id (inview: POINTER; outid: POINTER): INTEGER is
		local
		do
			Result := hiview_get_id_external (inview, outid)
		end

	hiview_set_command_id (inview: POINTER; incommandid: INTEGER): INTEGER is
		local
		do
			Result := hiview_set_command_id_external (inview, incommandid)
		end

	hiview_get_command_id (inview: POINTER; outcommandid: POINTER): INTEGER is
		local
		do
			Result := hiview_get_command_id_external (inview, outcommandid)
		end

	hiview_get_kind (inview: POINTER; outviewkind: POINTER): INTEGER is
		local
		do
			Result := hiview_get_kind_external (inview, outviewkind)
		end

	hiview_get_bounds (inview: POINTER; outrect: POINTER): INTEGER is
		local
		do
			Result := hiview_get_bounds_external (inview, outrect)
		end

	hiview_get_frame (inview: POINTER; outrect: POINTER): INTEGER is
		local
		do
			Result := hiview_get_frame_external (inview, outrect)
		end

	hiview_set_frame (inview: POINTER; inrect: POINTER): INTEGER is
		local
		do
			Result := hiview_set_frame_external (inview, inrect)
		end

	hiview_move_by (inview: POINTER; indx: REAL; indy: REAL): INTEGER is
		local
		do
			Result := hiview_move_by_external (inview, indx, indy)
		end

	hiview_place_in_superview_at (inview: POINTER; inx: REAL; iny: REAL): INTEGER is
		local
		do
			Result := hiview_place_in_superview_at_external (inview, inx, iny)
		end

	hiview_reshape_structure (inview: POINTER): INTEGER is
		local
		do
			Result := hiview_reshape_structure_external (inview)
		end

	hiview_region_changed (inview: POINTER; inregioncode: INTEGER): INTEGER is
		local
		do
			Result := hiview_region_changed_external (inview, inregioncode)
		end

	hiview_copy_shape (inview: POINTER; inpart: INTEGER; outshape: POINTER): INTEGER is
		local
		do
			Result := hiview_copy_shape_external (inview, inpart, outshape)
		end

	hiview_get_optimal_bounds (inview: POINTER; outbounds: POINTER; outbaselineoffset: POINTER): INTEGER is
		local
		do
			Result := hiview_get_optimal_bounds_external (inview, outbounds, outbaselineoffset)
		end

	hiview_get_view_for_mouse_event (inview: POINTER; inevent: POINTER; outview: POINTER): INTEGER is
		local
		do
			Result := hiview_get_view_for_mouse_event_external (inview, inevent, outview)
		end

	hiview_click (inview: POINTER; inevent: POINTER): INTEGER is
		local
		do
			Result := hiview_click_external (inview, inevent)
		end

	hiview_simulate_click (inview: POINTER; inparttoclick: INTEGER; inmodifiers: INTEGER; outpartclicked: POINTER): INTEGER is
		local
		do
			Result := hiview_simulate_click_external (inview, inparttoclick, inmodifiers, outpartclicked)
		end

	hiview_get_part_hit (inview: POINTER; inpoint: POINTER; outpart: POINTER): INTEGER is
		local
		do
			Result := hiview_get_part_hit_external (inview, inpoint, outpart)
		end

	hiview_get_subview_hit (inview: POINTER; inpoint: POINTER; indeep: INTEGER; outview: POINTER): INTEGER is
		local
		do
			Result := hiview_get_subview_hit_external (inview, inpoint, indeep, outview)
		end

	hiview_new_tracking_area (inview: POINTER; inshape: POINTER; inid: INTEGER; outref: POINTER): INTEGER is
		local
		do
			Result := hiview_new_tracking_area_external (inview, inshape, inid, outref)
		end

	hiview_change_tracking_area (inarea: POINTER; inshape: POINTER): INTEGER is
		local
		do
			Result := hiview_change_tracking_area_external (inarea, inshape)
		end

	hiview_get_tracking_area_id (inarea: POINTER; outid: POINTER): INTEGER is
		local
		do
			Result := hiview_get_tracking_area_id_external (inarea, outid)
		end

	hiview_dispose_tracking_area (inarea: POINTER): INTEGER is
		local
		do
			Result := hiview_dispose_tracking_area_external (inarea)
		end

	hiview_get_needs_display (inview: POINTER): INTEGER is
		local
		do
			Result := hiview_get_needs_display_external (inview)
		end

	hiview_set_needs_display (inview: POINTER; inneedsdisplay: INTEGER): INTEGER is
		local
		do
			Result := hiview_set_needs_display_external (inview, inneedsdisplay)
		end

	hiview_set_needs_display_in_rect (inview: POINTER; inrect: POINTER; inneedsdisplay: INTEGER): INTEGER is
		local
		do
			Result := hiview_set_needs_display_in_rect_external (inview, inrect, inneedsdisplay)
		end

	hiview_set_needs_display_in_shape (inview: POINTER; inarea: POINTER; inneedsdisplay: INTEGER): INTEGER is
		local
		do
			Result := hiview_set_needs_display_in_shape_external (inview, inarea, inneedsdisplay)
		end

	hiview_set_needs_display_in_region (inview: POINTER; inrgn: POINTER; inneedsdisplay: INTEGER): INTEGER is
		local
		do
			Result := hiview_set_needs_display_in_region_external (inview, inrgn, inneedsdisplay)
		end

	hiview_render (inview: POINTER): INTEGER is
		local
		do
			Result := hiview_render_external (inview)
		end

	hiview_flash_dirty_area (inwindow: POINTER): INTEGER is
		local
		do
			Result := hiview_flash_dirty_area_external (inwindow)
		end

	hiview_get_size_constraints (inview: POINTER; outminsize: POINTER; outmaxsize: POINTER): INTEGER is
		local
		do
			Result := hiview_get_size_constraints_external (inview, outminsize, outmaxsize)
		end

	hiview_convert_point (iopoint: POINTER; insourceview: POINTER; indestview: POINTER): INTEGER is
		local
		do
			Result := hiview_convert_point_external (iopoint, insourceview, indestview)
		end

	hiview_convert_rect (iorect: POINTER; insourceview: POINTER; indestview: POINTER): INTEGER is
		local
		do
			Result := hiview_convert_rect_external (iorect, insourceview, indestview)
		end

	hiview_convert_region (iorgn: POINTER; insourceview: POINTER; indestview: POINTER): INTEGER is
		local
		do
			Result := hiview_convert_region_external (iorgn, insourceview, indestview)
		end

	hiview_set_drawing_enabled (inview: POINTER; inenabled: INTEGER): INTEGER is
		local
		do
			Result := hiview_set_drawing_enabled_external (inview, inenabled)
		end

	hiview_is_drawing_enabled (inview: POINTER): INTEGER is
		local
		do
			Result := hiview_is_drawing_enabled_external (inview)
		end

	hiview_scroll_rect (inview: POINTER; inrect: POINTER; indx: REAL; indy: REAL): INTEGER is
		local
		do
			Result := hiview_scroll_rect_external (inview, inrect, indx, indy)
		end

	hiview_set_bounds_origin (inview: POINTER; inx: REAL; iny: REAL): INTEGER is
		local
		do
			Result := hiview_set_bounds_origin_external (inview, inx, iny)
		end

	hiview_advance_focus (inrootforfocus: POINTER; inmodifiers: INTEGER): INTEGER is
		local
		do
			Result := hiview_advance_focus_external (inrootforfocus, inmodifiers)
		end

	hiview_get_focus_part (inview: POINTER; outfocuspart: POINTER): INTEGER is
		local
		do
			Result := hiview_get_focus_part_external (inview, outfocuspart)
		end

	hiview_subtree_contains_focus (insubtreestart: POINTER): INTEGER is
		local
		do
			Result := hiview_subtree_contains_focus_external (insubtreestart)
		end

	hiview_set_next_focus (inview: POINTER; innextfocus: POINTER): INTEGER is
		local
		do
			Result := hiview_set_next_focus_external (inview, innextfocus)
		end

	hiview_set_first_sub_view_focus (inparent: POINTER; insubview: POINTER): INTEGER is
		local
		do
			Result := hiview_set_first_sub_view_focus_external (inparent, insubview)
		end

	hiview_get_layout_info (inview: POINTER; outlayoutinfo: POINTER): INTEGER is
		local
		do
			Result := hiview_get_layout_info_external (inview, outlayoutinfo)
		end

	hiview_set_layout_info (inview: POINTER; inlayoutinfo: POINTER): INTEGER is
		local
		do
			Result := hiview_set_layout_info_external (inview, inlayoutinfo)
		end

	hiview_suspend_layout (inview: POINTER): INTEGER is
		local
		do
			Result := hiview_suspend_layout_external (inview)
		end

	hiview_resume_layout (inview: POINTER): INTEGER is
		local
		do
			Result := hiview_resume_layout_external (inview)
		end

	hiview_is_layout_active (inview: POINTER): INTEGER is
		local
		do
			Result := hiview_is_layout_active_external (inview)
		end

	hiview_is_layout_latently_active (inview: POINTER): INTEGER is
		local
		do
			Result := hiview_is_layout_latently_active_external (inview)
		end

	hiview_apply_layout (inview: POINTER): INTEGER is
		local
		do
			Result := hiview_apply_layout_external (inview)
		end

	hiview_get_window (inview: POINTER): POINTER is
		local
		do
			Result := hiview_get_window_external (inview)
		end

	hiview_find_by_id (instartview: POINTER; inid: POINTER; outcontrol: POINTER): INTEGER is
		local
		do
			Result := hiview_find_by_id_external (instartview, inid, outcontrol)
		end

	hiview_get_attributes (inview: POINTER; outattrs: POINTER): INTEGER is
		local
		do
			Result := hiview_get_attributes_external (inview, outattrs)
		end

	hiview_change_attributes (inview: POINTER; inattrstoset: INTEGER; inattrstoclear: INTEGER): INTEGER is
		local
		do
			Result := hiview_change_attributes_external (inview, inattrstoset, inattrstoclear)
		end

	hiview_create_offscreen_image (inview: POINTER; inoptions: INTEGER; outframe: POINTER; outimage: POINTER): INTEGER is
		local
		do
			Result := hiview_create_offscreen_image_external (inview, inoptions, outframe, outimage)
		end

	hiview_draw_cgimage (incontext: POINTER; inbounds: POINTER; inimage: POINTER): INTEGER is
		local
		do
			Result := hiview_draw_cgimage_external (incontext, inbounds, inimage)
		end

	hiview_get_features (inview: POINTER; outfeatures: POINTER): INTEGER is
		local
		do
			Result := hiview_get_features_external (inview, outfeatures)
		end

	hiview_change_features (inview: POINTER; infeaturestoset: INTEGER; infeaturestoclear: INTEGER): INTEGER is
		local
		do
			Result := hiview_change_features_external (inview, infeaturestoset, infeaturestoclear)
		end

	hicreate_transformed_cgimage (inimage: POINTER; intransform: INTEGER; outimage: POINTER): INTEGER is
		local
		do
			Result := hicreate_transformed_cgimage_external (inimage, intransform, outimage)
		end

	hiview_get_event_target (inview: POINTER): POINTER is
		local
		do
			Result := hiview_get_event_target_external (inview)
		end

	higrow_box_view_set_transparent (ingrowboxview: POINTER; intransparent: INTEGER): INTEGER is
		local
		do
			Result := higrow_box_view_set_transparent_external (ingrowboxview, intransparent)
		end

	higrow_box_view_is_transparent (ingrowboxview: POINTER): INTEGER is
		local
		do
			Result := higrow_box_view_is_transparent_external (ingrowboxview)
		end

	hiscroll_view_create (inoptions: INTEGER; outview: POINTER): INTEGER is
		local
		do
			Result := hiscroll_view_create_external (inoptions, outview)
		end

	hiscroll_view_set_scroll_bar_auto_hide (inview: POINTER; inautohide: INTEGER): INTEGER is
		local
		do
			Result := hiscroll_view_set_scroll_bar_auto_hide_external (inview, inautohide)
		end

	hiscroll_view_get_scroll_bar_auto_hide (inview: POINTER): INTEGER is
		local
		do
			Result := hiscroll_view_get_scroll_bar_auto_hide_external (inview)
		end

	hiscroll_view_navigate (inview: POINTER; inaction: INTEGER): INTEGER is
		local
		do
			Result := hiscroll_view_navigate_external (inview, inaction)
		end

	hiscroll_view_can_navigate (inview: POINTER; inaction: INTEGER): INTEGER is
		local
		do
			Result := hiscroll_view_can_navigate_external (inview, inaction)
		end

	hiimage_view_create (inimage: POINTER; outcontrol: POINTER): INTEGER is
		local
		do
			Result := hiimage_view_create_external (inimage, outcontrol)
		end

	hiimage_view_set_opaque (inview: POINTER; inopaque: INTEGER): INTEGER is
		local
		do
			Result := hiimage_view_set_opaque_external (inview, inopaque)
		end

	hiimage_view_is_opaque (inview: POINTER): INTEGER is
		local
		do
			Result := hiimage_view_is_opaque_external (inview)
		end

	hiimage_view_set_alpha (inview: POINTER; inalpha: REAL): INTEGER is
		local
		do
			Result := hiimage_view_set_alpha_external (inview, inalpha)
		end

	hiimage_view_get_alpha (inview: POINTER): REAL is
		local
		do
			Result := hiimage_view_get_alpha_external (inview)
		end

	hiimage_view_set_scale_to_fit (inview: POINTER; inscaletofit: INTEGER): INTEGER is
		local
		do
			Result := hiimage_view_set_scale_to_fit_external (inview, inscaletofit)
		end

	hiimage_view_get_scale_to_fit (inview: POINTER): INTEGER is
		local
		do
			Result := hiimage_view_get_scale_to_fit_external (inview)
		end

	hiimage_view_set_image (inview: POINTER; inimage: POINTER): INTEGER is
		local
		do
			Result := hiimage_view_set_image_external (inview, inimage)
		end

	hiimage_view_copy_image (inview: POINTER): POINTER is
		local
		do
			Result := hiimage_view_copy_image_external (inview)
		end

	hicombo_box_create (boundsrect: POINTER; text: POINTER; style: POINTER; list: POINTER; inattributes: INTEGER; outcombobox: POINTER): INTEGER is
		local
		do
			Result := hicombo_box_create_external (boundsrect, text, style, list, inattributes, outcombobox)
		end

	hicombo_box_get_item_count (incombobox: POINTER): INTEGER is
		local
		do
			Result := hicombo_box_get_item_count_external (incombobox)
		end

	hicombo_box_insert_text_item_at_index (incombobox: POINTER; inindex: INTEGER; intext: POINTER): INTEGER is
		local
		do
			Result := hicombo_box_insert_text_item_at_index_external (incombobox, inindex, intext)
		end

	hicombo_box_append_text_item (incombobox: POINTER; intext: POINTER; outindex: POINTER): INTEGER is
		local
		do
			Result := hicombo_box_append_text_item_external (incombobox, intext, outindex)
		end

	hicombo_box_copy_text_item_at_index (incombobox: POINTER; inindex: INTEGER; outstring: POINTER): INTEGER is
		local
		do
			Result := hicombo_box_copy_text_item_at_index_external (incombobox, inindex, outstring)
		end

	hicombo_box_remove_item_at_index (incombobox: POINTER; inindex: INTEGER): INTEGER is
		local
		do
			Result := hicombo_box_remove_item_at_index_external (incombobox, inindex)
		end

	hicombo_box_change_attributes (incombobox: POINTER; inattributestoset: INTEGER; inattributestoclear: INTEGER): INTEGER is
		local
		do
			Result := hicombo_box_change_attributes_external (incombobox, inattributestoset, inattributestoclear)
		end

	hicombo_box_get_attributes (incombobox: POINTER; outattributes: POINTER): INTEGER is
		local
		do
			Result := hicombo_box_get_attributes_external (incombobox, outattributes)
		end

	hicombo_box_is_list_visible (incombobox: POINTER): INTEGER is
		local
		do
			Result := hicombo_box_is_list_visible_external (incombobox)
		end

	hicombo_box_set_list_visible (incombobox: POINTER; invisible: INTEGER): INTEGER is
		local
		do
			Result := hicombo_box_set_list_visible_external (incombobox, invisible)
		end

	hisearch_field_create (inbounds: POINTER; inattributes: INTEGER; insearchmenu: POINTER; indescriptivetext: POINTER; outref: POINTER): INTEGER is
		local
		do
			Result := hisearch_field_create_external (inbounds, inattributes, insearchmenu, indescriptivetext, outref)
		end

	hisearch_field_set_search_menu (insearchfield: POINTER; insearchmenu: POINTER): INTEGER is
		local
		do
			Result := hisearch_field_set_search_menu_external (insearchfield, insearchmenu)
		end

	hisearch_field_get_search_menu (insearchfield: POINTER; outsearchmenu: POINTER): INTEGER is
		local
		do
			Result := hisearch_field_get_search_menu_external (insearchfield, outsearchmenu)
		end

	hisearch_field_change_attributes (insearchfield: POINTER; inattributestoset: INTEGER; inattributestoclear: INTEGER): INTEGER is
		local
		do
			Result := hisearch_field_change_attributes_external (insearchfield, inattributestoset, inattributestoclear)
		end

	hisearch_field_get_attributes (insearchfield: POINTER; outattributes: POINTER): INTEGER is
		local
		do
			Result := hisearch_field_get_attributes_external (insearchfield, outattributes)
		end

	hisearch_field_set_descriptive_text (insearchfield: POINTER; indescription: POINTER): INTEGER is
		local
		do
			Result := hisearch_field_set_descriptive_text_external (insearchfield, indescription)
		end

	hisearch_field_copy_descriptive_text (insearchfield: POINTER; outdescription: POINTER): INTEGER is
		local
		do
			Result := hisearch_field_copy_descriptive_text_external (insearchfield, outdescription)
		end

	himenu_view_get_menu (inview: POINTER): POINTER is
		local
		do
			Result := himenu_view_get_menu_external (inview)
		end

	himenu_get_content_view (inmenu: POINTER; inmenutype: INTEGER; outview: POINTER): INTEGER is
		local
		do
			Result := himenu_get_content_view_external (inmenu, inmenutype, outview)
		end

	hisegmented_view_create (inbounds: POINTER; outref: POINTER): INTEGER is
		local
		do
			Result := hisegmented_view_create_external (inbounds, outref)
		end

	hisegmented_view_set_segment_count (insegmentedview: POINTER; insegmentcount: INTEGER): INTEGER is
		local
		do
			Result := hisegmented_view_set_segment_count_external (insegmentedview, insegmentcount)
		end

	hisegmented_view_get_segment_count (insegmentedview: POINTER): INTEGER is
		local
		do
			Result := hisegmented_view_get_segment_count_external (insegmentedview)
		end

	hisegmented_view_set_segment_behavior (insegmentedview: POINTER; insegmentindexonebased: INTEGER; inbehavior: INTEGER): INTEGER is
		local
		do
			Result := hisegmented_view_set_segment_behavior_external (insegmentedview, insegmentindexonebased, inbehavior)
		end

	hisegmented_view_get_segment_behavior (insegmentedview: POINTER; insegmentindexonebased: INTEGER): INTEGER is
		local
		do
			Result := hisegmented_view_get_segment_behavior_external (insegmentedview, insegmentindexonebased)
		end

	hisegmented_view_change_segment_attributes (insegmentedview: POINTER; insegmentindexonebased: INTEGER; inattributestoset: INTEGER; inattributestoclear: INTEGER): INTEGER is
		local
		do
			Result := hisegmented_view_change_segment_attributes_external (insegmentedview, insegmentindexonebased, inattributestoset, inattributestoclear)
		end

	hisegmented_view_get_segment_attributes (insegmentedview: POINTER; insegmentindexonebased: INTEGER): INTEGER is
		local
		do
			Result := hisegmented_view_get_segment_attributes_external (insegmentedview, insegmentindexonebased)
		end

	hisegmented_view_set_segment_value (insegmentedview: POINTER; insegmentindexonebased: INTEGER; invalue: INTEGER): INTEGER is
		local
		do
			Result := hisegmented_view_set_segment_value_external (insegmentedview, insegmentindexonebased, invalue)
		end

	hisegmented_view_get_segment_value (insegmentedview: POINTER; insegmentindexonebased: INTEGER): INTEGER is
		local
		do
			Result := hisegmented_view_get_segment_value_external (insegmentedview, insegmentindexonebased)
		end

	hisegmented_view_set_segment_enabled (insegmentedview: POINTER; insegmentindexonebased: INTEGER; inenabled: INTEGER): INTEGER is
		local
		do
			Result := hisegmented_view_set_segment_enabled_external (insegmentedview, insegmentindexonebased, inenabled)
		end

	hisegmented_view_is_segment_enabled (insegmentedview: POINTER; insegmentindexonebased: INTEGER): INTEGER is
		local
		do
			Result := hisegmented_view_is_segment_enabled_external (insegmentedview, insegmentindexonebased)
		end

	hisegmented_view_set_segment_command (insegmentedview: POINTER; insegmentindexonebased: INTEGER; incommand: INTEGER): INTEGER is
		local
		do
			Result := hisegmented_view_set_segment_command_external (insegmentedview, insegmentindexonebased, incommand)
		end

	hisegmented_view_get_segment_command (insegmentedview: POINTER; insegmentindexonebased: INTEGER): INTEGER is
		local
		do
			Result := hisegmented_view_get_segment_command_external (insegmentedview, insegmentindexonebased)
		end

	hisegmented_view_set_segment_label (insegmentedview: POINTER; insegmentindexonebased: INTEGER; inlabel: POINTER): INTEGER is
		local
		do
			Result := hisegmented_view_set_segment_label_external (insegmentedview, insegmentindexonebased, inlabel)
		end

	hisegmented_view_copy_segment_label (insegmentedview: POINTER; insegmentindexonebased: INTEGER; outlabel: POINTER): INTEGER is
		local
		do
			Result := hisegmented_view_copy_segment_label_external (insegmentedview, insegmentindexonebased, outlabel)
		end

	hisegmented_view_set_segment_content_width (insegmentedview: POINTER; insegmentindexonebased: INTEGER; inautocalculatewidth: INTEGER; inwidth: REAL): INTEGER is
		local
		do
			Result := hisegmented_view_set_segment_content_width_external (insegmentedview, insegmentindexonebased, inautocalculatewidth, inwidth)
		end

	hisegmented_view_get_segment_content_width (insegmentedview: POINTER; insegmentindexonebased: INTEGER; outautocalculated: STRING): REAL is
		local
			outautocalculated_c_string: EWG_ZERO_TERMINATED_STRING
		do
			create outautocalculated_c_string.make_shared_from_string (outautocalculated)
			Result := hisegmented_view_get_segment_content_width_external (insegmentedview, insegmentindexonebased, outautocalculated_c_string.item)
		end

	hisegmented_view_set_segment_image (insegmentedview: POINTER; insegmentindexonebased: INTEGER; inimage: POINTER): INTEGER is
		local
		do
			Result := hisegmented_view_set_segment_image_external (insegmentedview, insegmentindexonebased, inimage)
		end

	hisegmented_view_get_segment_image_content_type (insegmentedview: POINTER; insegmentindexonebased: INTEGER): INTEGER is
		local
		do
			Result := hisegmented_view_get_segment_image_content_type_external (insegmentedview, insegmentindexonebased)
		end

	hisegmented_view_copy_segment_image (insegmentedview: POINTER; insegmentindexonebased: INTEGER; ioimage: POINTER): INTEGER is
		local
		do
			Result := hisegmented_view_copy_segment_image_external (insegmentedview, insegmentindexonebased, ioimage)
		end

end