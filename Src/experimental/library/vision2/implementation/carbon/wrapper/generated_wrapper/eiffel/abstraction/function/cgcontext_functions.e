-- This file has been generated by EWG. Do not edit. Changes will be lost!
-- functions wrapper
class CGCONTEXT_FUNCTIONS

obsolete
	"Use class CGCONTEXT_FUNCTIONS_EXTERNAL instead."

inherit

	CGCONTEXT_FUNCTIONS_EXTERNAL

feature
	cgcontext_get_type_id: INTEGER is
		local
		do
			Result := cgcontext_get_type_id_external
		end

	cgcontext_save_gstate (c: POINTER) is
		local
		do
			cgcontext_save_gstate_external (c)
		end

	cgcontext_restore_gstate (c: POINTER) is
		local
		do
			cgcontext_restore_gstate_external (c)
		end

	cgcontext_scale_ctm (c: POINTER; sx: REAL; sy: REAL) is
		local
		do
			cgcontext_scale_ctm_external (c, sx, sy)
		end

	cgcontext_translate_ctm (c: POINTER; tx: REAL; ty: REAL) is
		local
		do
			cgcontext_translate_ctm_external (c, tx, ty)
		end

	cgcontext_rotate_ctm (c: POINTER; angle: REAL) is
		local
		do
			cgcontext_rotate_ctm_external (c, angle)
		end

	cgcontext_concat_ctm (c: POINTER; transform: POINTER) is
		local
		do
			cgcontext_concat_ctm_external (c, transform)
		end

-- Ignoring cgcontext_get_ctm since its return type is a composite type

	cgcontext_set_line_width (c: POINTER; width: REAL) is
		local
		do
			cgcontext_set_line_width_external (c, width)
		end

	cgcontext_set_line_cap (c: POINTER; cap: INTEGER) is
		local
		do
			cgcontext_set_line_cap_external (c, cap)
		end

	cgcontext_set_line_join (c: POINTER; join: INTEGER) is
		local
		do
			cgcontext_set_line_join_external (c, join)
		end

	cgcontext_set_miter_limit (c: POINTER; limit: REAL) is
		local
		do
			cgcontext_set_miter_limit_external (c, limit)
		end

	cgcontext_set_line_dash (c: POINTER; phase: REAL; lengths: POINTER; count: INTEGER) is
		local
		do
			cgcontext_set_line_dash_external (c, phase, lengths, count)
		end

	cgcontext_set_flatness (c: POINTER; flatness: REAL) is
		local
		do
			cgcontext_set_flatness_external (c, flatness)
		end

	cgcontext_set_alpha (c: POINTER; alpha: REAL) is
		local
		do
			cgcontext_set_alpha_external (c, alpha)
		end

	cgcontext_set_blend_mode (context: POINTER; mode: INTEGER) is
		local
		do
			cgcontext_set_blend_mode_external (context, mode)
		end

	cgcontext_begin_path (c: POINTER) is
		local
		do
			cgcontext_begin_path_external (c)
		end

	cgcontext_move_to_point (c: POINTER; x: REAL; y: REAL) is
		local
		do
			cgcontext_move_to_point_external (c, x, y)
		end

	cgcontext_add_line_to_point (c: POINTER; x: REAL; y: REAL) is
		local
		do
			cgcontext_add_line_to_point_external (c, x, y)
		end

	cgcontext_add_curve_to_point (c: POINTER; cp1x: REAL; cp1y: REAL; cp2x: REAL; cp2y: REAL; x: REAL; y: REAL) is
		local
		do
			cgcontext_add_curve_to_point_external (c, cp1x, cp1y, cp2x, cp2y, x, y)
		end

	cgcontext_add_quad_curve_to_point (c: POINTER; cpx: REAL; cpy: REAL; x: REAL; y: REAL) is
		local
		do
			cgcontext_add_quad_curve_to_point_external (c, cpx, cpy, x, y)
		end

	cgcontext_close_path (c: POINTER) is
		local
		do
			cgcontext_close_path_external (c)
		end

	cgcontext_add_rect (c: POINTER; rect: POINTER) is
		local
		do
			cgcontext_add_rect_external (c, rect)
		end

	cgcontext_add_rects (c: POINTER; rects: POINTER; count: INTEGER) is
		local
		do
			cgcontext_add_rects_external (c, rects, count)
		end

	cgcontext_add_lines (c: POINTER; points: POINTER; count: INTEGER) is
		local
		do
			cgcontext_add_lines_external (c, points, count)
		end

	cgcontext_add_ellipse_in_rect (context: POINTER; rect: POINTER) is
		local
		do
			cgcontext_add_ellipse_in_rect_external (context, rect)
		end

	cgcontext_add_arc (c: POINTER; x: REAL; y: REAL; radius: REAL; startangle: REAL; endangle: REAL; clockwise: INTEGER) is
		local
		do
			cgcontext_add_arc_external (c, x, y, radius, startangle, endangle, clockwise)
		end

	cgcontext_add_arc_to_point (c: POINTER; x1: REAL; y1: REAL; x2: REAL; y2: REAL; radius: REAL) is
		local
		do
			cgcontext_add_arc_to_point_external (c, x1, y1, x2, y2, radius)
		end

	cgcontext_add_path (context: POINTER; path: POINTER) is
		local
		do
			cgcontext_add_path_external (context, path)
		end

	cgcontext_replace_path_with_stroked_path (c: POINTER) is
		local
		do
			cgcontext_replace_path_with_stroked_path_external (c)
		end

	cgcontext_is_path_empty (c: POINTER): INTEGER is
		local
		do
			Result := cgcontext_is_path_empty_external (c)
		end

-- Ignoring cgcontext_get_path_current_point since its return type is a composite type

-- Ignoring cgcontext_get_path_bounding_box since its return type is a composite type

	cgcontext_path_contains_point (context: POINTER; point: POINTER; mode: INTEGER): INTEGER is
		local
		do
			Result := cgcontext_path_contains_point_external (context, point, mode)
		end

	cgcontext_draw_path (c: POINTER; mode: INTEGER) is
		local
		do
			cgcontext_draw_path_external (c, mode)
		end

	cgcontext_fill_path (c: POINTER) is
		local
		do
			cgcontext_fill_path_external (c)
		end

	cgcontext_eofill_path (c: POINTER) is
		local
		do
			cgcontext_eofill_path_external (c)
		end

	cgcontext_stroke_path (c: POINTER) is
		local
		do
			cgcontext_stroke_path_external (c)
		end

	cgcontext_fill_rect (c: POINTER; rect: POINTER) is
		local
		do
			cgcontext_fill_rect_external (c, rect)
		end

	cgcontext_fill_rects (c: POINTER; rects: POINTER; count: INTEGER) is
		local
		do
			cgcontext_fill_rects_external (c, rects, count)
		end

	cgcontext_stroke_rect (c: POINTER; rect: POINTER) is
		local
		do
			cgcontext_stroke_rect_external (c, rect)
		end

	cgcontext_stroke_rect_with_width (c: POINTER; rect: POINTER; width: REAL) is
		local
		do
			cgcontext_stroke_rect_with_width_external (c, rect, width)
		end

	cgcontext_clear_rect (c: POINTER; rect: POINTER) is
		local
		do
			cgcontext_clear_rect_external (c, rect)
		end

	cgcontext_fill_ellipse_in_rect (context: POINTER; rect: POINTER) is
		local
		do
			cgcontext_fill_ellipse_in_rect_external (context, rect)
		end

	cgcontext_stroke_ellipse_in_rect (context: POINTER; rect: POINTER) is
		local
		do
			cgcontext_stroke_ellipse_in_rect_external (context, rect)
		end

	cgcontext_stroke_line_segments (c: POINTER; points: POINTER; count: INTEGER) is
		local
		do
			cgcontext_stroke_line_segments_external (c, points, count)
		end

	cgcontext_clip (c: POINTER) is
		local
		do
			cgcontext_clip_external (c)
		end

	cgcontext_eoclip (c: POINTER) is
		local
		do
			cgcontext_eoclip_external (c)
		end

	cgcontext_clip_to_mask (c: POINTER; rect: POINTER; mask: POINTER) is
		local
		do
			cgcontext_clip_to_mask_external (c, rect, mask)
		end

-- Ignoring cgcontext_get_clip_bounding_box since its return type is a composite type

	cgcontext_clip_to_rect (c: POINTER; rect: POINTER) is
		local
		do
			cgcontext_clip_to_rect_external (c, rect)
		end

	cgcontext_clip_to_rects (c: POINTER; rects: POINTER; count: INTEGER) is
		local
		do
			cgcontext_clip_to_rects_external (c, rects, count)
		end

	cgcontext_set_fill_color_with_color (c: POINTER; color: POINTER) is
		local
		do
			cgcontext_set_fill_color_with_color_external (c, color)
		end

	cgcontext_set_stroke_color_with_color (c: POINTER; color: POINTER) is
		local
		do
			cgcontext_set_stroke_color_with_color_external (c, color)
		end

	cgcontext_set_fill_color_space (c: POINTER; colorspace: POINTER) is
		local
		do
			cgcontext_set_fill_color_space_external (c, colorspace)
		end

	cgcontext_set_stroke_color_space (c: POINTER; colorspace: POINTER) is
		local
		do
			cgcontext_set_stroke_color_space_external (c, colorspace)
		end

	cgcontext_set_fill_color (c: POINTER; components: POINTER) is
		local
		do
			cgcontext_set_fill_color_external (c, components)
		end

	cgcontext_set_stroke_color (c: POINTER; components: POINTER) is
		local
		do
			cgcontext_set_stroke_color_external (c, components)
		end

	cgcontext_set_fill_pattern (c: POINTER; pattern: POINTER; components: POINTER) is
		local
		do
			cgcontext_set_fill_pattern_external (c, pattern, components)
		end

	cgcontext_set_stroke_pattern (c: POINTER; pattern: POINTER; components: POINTER) is
		local
		do
			cgcontext_set_stroke_pattern_external (c, pattern, components)
		end

	cgcontext_set_pattern_phase (c: POINTER; phase: POINTER) is
		local
		do
			cgcontext_set_pattern_phase_external (c, phase)
		end

	cgcontext_set_gray_fill_color (c: POINTER; gray: REAL; alpha: REAL) is
		local
		do
			cgcontext_set_gray_fill_color_external (c, gray, alpha)
		end

	cgcontext_set_gray_stroke_color (c: POINTER; gray: REAL; alpha: REAL) is
		local
		do
			cgcontext_set_gray_stroke_color_external (c, gray, alpha)
		end

	cgcontext_set_rgbfill_color (c: POINTER; red: REAL; green: REAL; blue: REAL; alpha: REAL) is
		local
		do
			cgcontext_set_rgbfill_color_external (c, red, green, blue, alpha)
		end

	cgcontext_set_rgbstroke_color (c: POINTER; red: REAL; green: REAL; blue: REAL; alpha: REAL) is
		local
		do
			cgcontext_set_rgbstroke_color_external (c, red, green, blue, alpha)
		end

	cgcontext_set_cmykfill_color (c: POINTER; cyan: REAL; magenta: REAL; yellow: REAL; black: REAL; alpha: REAL) is
		local
		do
			cgcontext_set_cmykfill_color_external (c, cyan, magenta, yellow, black, alpha)
		end

	cgcontext_set_cmykstroke_color (c: POINTER; cyan: REAL; magenta: REAL; yellow: REAL; black: REAL; alpha: REAL) is
		local
		do
			cgcontext_set_cmykstroke_color_external (c, cyan, magenta, yellow, black, alpha)
		end

	cgcontext_set_rendering_intent (c: POINTER; intent: INTEGER) is
		local
		do
			cgcontext_set_rendering_intent_external (c, intent)
		end

	cgcontext_draw_image (c: POINTER; rect: POINTER; image: POINTER) is
		local
		do
			cgcontext_draw_image_external (c, rect, image)
		end

	cgcontext_get_interpolation_quality (c: POINTER): INTEGER is
		local
		do
			Result := cgcontext_get_interpolation_quality_external (c)
		end

	cgcontext_set_interpolation_quality (c: POINTER; quality: INTEGER) is
		local
		do
			cgcontext_set_interpolation_quality_external (c, quality)
		end

	cgcontext_set_shadow_with_color (context: POINTER; offset: POINTER; blur: REAL; color: POINTER) is
		local
		do
			cgcontext_set_shadow_with_color_external (context, offset, blur, color)
		end

	cgcontext_set_shadow (context: POINTER; offset: POINTER; blur: REAL) is
		local
		do
			cgcontext_set_shadow_external (context, offset, blur)
		end

	cgcontext_draw_shading (c: POINTER; shading: POINTER) is
		local
		do
			cgcontext_draw_shading_external (c, shading)
		end

	cgcontext_set_character_spacing (c: POINTER; spacing: REAL) is
		local
		do
			cgcontext_set_character_spacing_external (c, spacing)
		end

	cgcontext_set_text_position (c: POINTER; x: REAL; y: REAL) is
		local
		do
			cgcontext_set_text_position_external (c, x, y)
		end

-- Ignoring cgcontext_get_text_position since its return type is a composite type

	cgcontext_set_text_matrix (c: POINTER; t: POINTER) is
		local
		do
			cgcontext_set_text_matrix_external (c, t)
		end

-- Ignoring cgcontext_get_text_matrix since its return type is a composite type

	cgcontext_set_text_drawing_mode (c: POINTER; mode: INTEGER) is
		local
		do
			cgcontext_set_text_drawing_mode_external (c, mode)
		end

	cgcontext_set_font (c: POINTER; font: POINTER) is
		local
		do
			cgcontext_set_font_external (c, font)
		end

	cgcontext_set_font_size (c: POINTER; size: REAL) is
		local
		do
			cgcontext_set_font_size_external (c, size)
		end

	cgcontext_select_font (c: POINTER; name: STRING; size: REAL; textencoding: INTEGER) is
		local
			name_c_string: EWG_ZERO_TERMINATED_STRING
		do
			create name_c_string.make_shared_from_string (name)
			cgcontext_select_font_external (c, name_c_string.item, size, textencoding)
		end

	cgcontext_show_text (c: POINTER; a_string: STRING; length: INTEGER) is
		local
			a_string_c_string: EWG_ZERO_TERMINATED_STRING
		do
			create a_string_c_string.make_shared_from_string (a_string)
			cgcontext_show_text_external (c, a_string_c_string.item, length)
		end

	cgcontext_show_glyphs (c: POINTER; g: POINTER; count: INTEGER) is
		local
		do
			cgcontext_show_glyphs_external (c, g, count)
		end

	cgcontext_show_glyphs_with_advances (c: POINTER; glyphs: POINTER; advances: POINTER; count: INTEGER) is
		local
		do
			cgcontext_show_glyphs_with_advances_external (c, glyphs, advances, count)
		end

	cgcontext_show_text_at_point (c: POINTER; x: REAL; y: REAL; a_string: STRING; length: INTEGER) is
		local
			a_string_c_string: EWG_ZERO_TERMINATED_STRING
		do
			create a_string_c_string.make_shared_from_string (a_string)
			cgcontext_show_text_at_point_external (c, x, y, a_string_c_string.item, length)
		end

	cgcontext_show_glyphs_at_point (c: POINTER; x: REAL; y: REAL; glyphs: POINTER; count: INTEGER) is
		local
		do
			cgcontext_show_glyphs_at_point_external (c, x, y, glyphs, count)
		end

	cgcontext_draw_pdfpage (c: POINTER; page: POINTER) is
		local
		do
			cgcontext_draw_pdfpage_external (c, page)
		end

	cgcontext_draw_pdfdocument (c: POINTER; rect: POINTER; document: POINTER; page: INTEGER) is
		local
		do
			cgcontext_draw_pdfdocument_external (c, rect, document, page)
		end

	cgcontext_begin_page (c: POINTER; mediabox: POINTER) is
		local
		do
			cgcontext_begin_page_external (c, mediabox)
		end

	cgcontext_end_page (c: POINTER) is
		local
		do
			cgcontext_end_page_external (c)
		end

	cgcontext_retain (c: POINTER): POINTER is
		local
		do
			Result := cgcontext_retain_external (c)
		end

	cgcontext_release (c: POINTER) is
		local
		do
			cgcontext_release_external (c)
		end

	cgcontext_flush (c: POINTER) is
		local
		do
			cgcontext_flush_external (c)
		end

	cgcontext_synchronize (c: POINTER) is
		local
		do
			cgcontext_synchronize_external (c)
		end

	cgcontext_set_should_antialias (c: POINTER; shouldantialias: INTEGER) is
		local
		do
			cgcontext_set_should_antialias_external (c, shouldantialias)
		end

	cgcontext_set_allows_antialiasing (context: POINTER; allowsantialiasing: INTEGER) is
		local
		do
			cgcontext_set_allows_antialiasing_external (context, allowsantialiasing)
		end

	cgcontext_set_should_smooth_fonts (c: POINTER; shouldsmoothfonts: INTEGER) is
		local
		do
			cgcontext_set_should_smooth_fonts_external (c, shouldsmoothfonts)
		end

	cgcontext_begin_transparency_layer (context: POINTER; auxiliaryinfo: POINTER) is
		local
		do
			cgcontext_begin_transparency_layer_external (context, auxiliaryinfo)
		end

	cgcontext_end_transparency_layer (context: POINTER) is
		local
		do
			cgcontext_end_transparency_layer_external (context)
		end

-- Ignoring cgcontext_get_user_space_to_device_space_transform since its return type is a composite type

-- Ignoring cgcontext_convert_point_to_device_space since its return type is a composite type

-- Ignoring cgcontext_convert_point_to_user_space since its return type is a composite type

-- Ignoring cgcontext_convert_size_to_device_space since its return type is a composite type

-- Ignoring cgcontext_convert_size_to_user_space since its return type is a composite type

-- Ignoring cgcontext_convert_rect_to_device_space since its return type is a composite type

-- Ignoring cgcontext_convert_rect_to_user_space since its return type is a composite type

end
