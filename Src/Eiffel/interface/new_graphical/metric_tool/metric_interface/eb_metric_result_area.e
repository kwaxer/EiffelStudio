note
	description: "Objects that represent an EV_TITLED_WINDOW.%
		%The original version of this class was generated by EiffelBuild."
	legal: "See notice at end of class."
	status: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

class
	EB_METRIC_RESULT_AREA

inherit
	EV_VERTICAL_BOX
		redefine
			initialize,
			is_in_default_state
		end

	EB_CONSTANTS
		undefine
			is_equal,
			copy,
			default_create
		end

	EB_METRIC_INTERFACE_PROVIDER
		undefine
			is_equal,
			copy,
			default_create
		end

	EVS_GRID_TWO_WAY_SORTING_ORDER
		undefine
			is_equal,
			copy,
			default_create
		end

	EB_SHARED_WRITER
		undefine
			is_equal,
			copy,
			default_create
		end

	QL_SHARED_NAMES
		undefine
			is_equal,
			copy,
			default_create
		end

	EB_METRIC_INTERFACE_PROVIDER
		undefine
			is_equal,
			copy,
			default_create
		end

	EB_PIXMAPABLE_ITEM_PIXMAP_FACTORY
		export
			{NONE} all
		undefine
			is_equal,
			copy,
			default_create
		end

	EB_METRIC_PANEL
		undefine
			is_equal,
			copy,
			default_create
		end

create
	make

feature {NONE} -- Initialization

	make (a_tool: like metric_tool)
			-- Initialize `metric_tool' with `a_tool'.
		require
			a_tool_attached: a_tool /= Void
		do
			metric_tool := a_tool
			install_agents (metric_tool)
			install_metric_history_agent
			on_unit_order_change_agent := agent on_unit_order_change
			default_create
			set_is_up_to_date (True)
			set_has_last_result_been_displayed (True)
		ensure
			metric_tool_attached: metric_tool = a_tool
		end

	initialize
			-- Initialize `Current'.
		local
			l_text: EV_TEXT
		do
			create metric_result.make (metric_tool, Current)
			create archive_result.make (metric_tool, Current)

			Precursor {EV_VERTICAL_BOX}
				-- Create all widgets.
			create metric_result_area
			create archive_result_area
			create dummy_area
			create dummy_text

				-- Build widget structure.
			extend (metric_result_area)
			extend (archive_result_area)
			extend (dummy_area)
			dummy_text.disable_edit
			dummy_text.set_text (metric_names.l_no_result_available)
			dummy_area.extend (dummy_text)
			metric_result_area.extend (metric_result)
			archive_result_area.extend (archive_result)
			metric_result_area.hide
			archive_result_area.hide
			create l_text
			dummy_text.set_background_color (l_text.background_color)
			dummy_area.show

			append_drop_actions (
				{ARRAY [EV_PICK_AND_DROPABLE_ACTION_SEQUENCES]} <<dummy_text>>,
				metric_tool
			)
		end

feature -- Access

	metric_result: EB_METRIC_CALCULATION_RESULT_AREA
			-- Area to display metric result

	archive_result: EB_METRIC_ARCHIVE_RESULT_AREA
			-- Area to display metric archive comparison result

	last_metric: EB_METRIC
			-- Last calculated metric	

	last_value: DOUBLE
			-- Last calculated value

	last_metric_calculation_time: DATE_TIME
			-- Last calculation time for `last_metric'

	last_source_domain: EB_METRIC_DOMAIN
			-- Last source domain	

	last_result_domain: QL_DOMAIN
			-- Domain of last result

	last_reference_archive: LIST [EB_METRIC_ARCHIVE_NODE]
			-- Last reference archive

	last_current_archive: LIST [EB_METRIC_ARCHIVE_NODE]
			-- Last current archive

	is_last_metric_result_from_history: BOOLEAN
			-- Is last metric result from history panel?

	is_last_result_filtered: BOOLEAN
			-- Is result filtered when last metric is calculated?

feature -- Status report

	has_last_result_been_displayed: BOOLEAN
			-- Has last metric value/archive display requirest been fullfilled?

	should_refresh_metric_result: BOOLEAN
			-- Should metric detailed result be refreshed due to Eiffel compilation?

	should_metric_result_be_displayed: BOOLEAN
			-- Should metric result be displayed instead of archive result?

	should_archive_result_be_displayed: BOOLEAN
			-- Should archive result be displayed instead of metric result?
		do
			Result := not should_metric_result_be_displayed
		end

	set_has_last_result_been_displayed (b: BOOLEAN)
			-- Set `has_last_result_been_displayed' with `b'.
		do
			has_last_result_been_displayed := b
		ensure
			has_last_result_been_displayed_set: has_last_result_been_displayed = b
		end

	set_should_refresh_metric_result (b: BOOLEAN)
			-- Set `should_refresh_metric_result' with `b'.
		do
			should_refresh_metric_result := b
		ensure
			should_refresh_metric_result_set: should_refresh_metric_result = b
		end

feature -- Actions

	on_display_metric_value (a_metric: like last_metric; a_value: like last_value; a_source_domain: like last_source_domain; a_domain: like last_result_domain; a_time: like last_metric_calculation_time; a_from_history: BOOLEAN; a_filtered: BOOLEAN)
			-- Switch current panel to display metric evaluation `a_value' for `a_metric' calculated against `a_source_domain'.
			-- `a_domain' is the detailed metric result. `a_domain' can be Void.
			-- `a_time' is when `a_metric' was calculated.
			-- `a_from_history' mean if current result is from history panel.
			-- `a_filtered' indicates if result was filtered.
		require
			a_metric_attached: a_metric /= Void
			a_source_domain_attached: a_source_domain /= Void
			a_time_attached: a_time /= Void
		do
			last_reference_archive := Void
			last_current_archive := Void
			last_metric := a_metric
			last_value := a_value
			last_source_domain := a_source_domain
			last_result_domain := a_domain
			last_metric_calculation_time := a_time
			should_metric_result_be_displayed := True
			set_has_last_result_been_displayed (False)
			set_is_up_to_date (False)
			is_last_metric_result_from_history := a_from_history
			is_last_result_filtered := a_filtered
			update_ui
		end

	on_display_archive_value (a_current_archive: like last_current_archive; a_referenced_archive: like last_reference_archive)
			-- Switch current panel to display metric archive from `a_current_archive 'and `a_referenced_archive'.
		require
			archive_valid: not (a_current_archive = Void and then a_referenced_archive = Void)
		do
			last_result_domain := Void
			last_metric := Void
			last_source_domain := Void
			last_value := 0
			last_current_archive := a_current_archive
			last_reference_archive := a_referenced_archive
			should_metric_result_be_displayed := False
			set_has_last_result_been_displayed (False)
			set_is_up_to_date (False)
			update_ui
		end

	on_send_metric_to_history
			-- Action to be performed to send last calculated metric to history
		require
			last_metric_attached: last_metric /= Void
			last_source_domain_attached: last_source_domain /= Void
		do
			metric_tool.on_send_metric_value_in_history (
				create{EB_METRIC_ARCHIVE_NODE}.make (last_metric.name, metric_type_id (last_metric), last_metric_calculation_time, last_value, last_source_domain, uuid_gen.generate_uuid, is_last_result_filtered),
				Current
			)
		end

feature -- Basic operations

	force_drop_stone (a_stone: STONE)
			-- Force to drop `a_stone' in `domain_selector'.
		do
		end

feature {NONE} -- Recycle

	internal_recycle
			-- To be called when the button has became useless.
		do
			metric_result.recycle
			archive_result.recycle
			uninstall_agents (metric_tool)
			metric_tool.send_metric_value_in_history_actions.prune_all (on_metric_sent_to_history_agent)
			uninstall_metric_history_agent
		end

feature{NONE} -- Actions

	on_project_loaded
			-- Action to be performed when project loaded
		do
		end

	on_project_unloaded
			-- Action to be performed when project unloaded
		do
		end

	on_compile_start
			-- Action to be performed when Eiffel compilation starts
		do
			set_is_up_to_date (False)
			update_ui
		end

	on_compile_stop
			-- Action to be performed when Eiffel compilation stops
		do
			set_should_refresh_metric_result (True)
			set_is_up_to_date (False)
			update_ui
		end

	on_metric_evaluation_start (a_data: ANY)
			-- Action to be performed when metric evaluation starts
			-- `a_data' can be the metric tool panel from which metric evaluation starts.
		do
		end

	on_metric_evaluation_stop (a_data: ANY)
			-- Action to be performed when metric evaluation stops
			-- `a_data' can be the metric tool panel from which metric evaluation stops.
		do
		end

	on_archive_calculation_start (a_data: ANY)
			-- Action to be performed when metric archive calculation starts
			-- `a_data' can be the metric tool panel from which metric archive calculation starts.
		do
		end

	on_archive_calculation_stop (a_data: ANY)
			-- Action to be performed when metric archive calculation stops
			-- `a_data' can be the metric tool panel from which metric archive calculation stops.
		do
		end

	on_metric_loaded
			-- Action to be performed when metrics loaded in `metric_manager'
		do
			set_is_metric_reloaded (True)
		end

	on_history_recalculation_start (a_data: ANY)
			-- Action to be performed when archive history recalculation starts
			-- `a_data' can be the metric tool panel from which metric history recalculation starts.
		do
			set_is_up_to_date (False)
			update_ui
		end

	on_history_recalculation_stop (a_data: ANY)
			-- Action to be performed when archive history recalculation stops
			-- `a_data' can be the metric tool panel from which metric history recalculation stops.
		do
			set_is_up_to_date (False)
			update_ui
		end

	on_metric_sent_to_history (a_archive: EB_METRIC_ARCHIVE_NODE; a_panel: ANY)
			-- Action to be performed when metric calculation information contained in `a_archive' has been sent to history
		do
			set_is_up_to_date (False)
			update_ui
		end

	on_metric_renamed (a_old_name, a_new_name: STRING)
			-- Action to be performed when a metric with `a_old_name' has been renamed to `a_new_name'.
		do
		end

feature{NONE} -- UI Update

	update_ui
			-- Update interface
		do
			if is_selected and then not is_up_to_date then
				if not has_last_result_been_displayed then
					if should_metric_result_be_displayed then
						metric_result_area.show
						dummy_area.hide
						archive_result_area.hide
						metric_result.update_warning_area.hide
						metric_result.load_metric_result (last_metric, last_source_domain, last_value, last_result_domain)
					else
						metric_result_area.hide
						dummy_area.hide
						archive_result_area.show
						archive_result.load_archives (last_reference_archive, last_current_archive)
					end
					set_has_last_result_been_displayed (True)
				end
				if should_refresh_metric_result then
					metric_result.refresh_grid
					if last_metric /= Void then
						metric_result.update_warning_area.show
					end
					set_should_refresh_metric_result (False)
				end
				if should_metric_result_be_displayed then
					if last_metric_value_historyed or else is_last_metric_result_from_history then
						metric_result.send_to_history_btn.disable_sensitive
					else
						metric_result.send_to_history_btn.enable_sensitive
					end
				end
				set_is_up_to_date (True)
			end
		end

feature{NONE} -- Implementation

	dummy_text: EV_TEXT
	metric_result_area, archive_result_area, dummy_area: EV_VERTICAL_BOX

	is_in_default_state: BOOLEAN
			-- Is `Current' in its default state.
		do
			Result := True
		end

invariant
	metric_result_attached: metric_result /= Void
	archive_result_attached: archive_result /= Void

note
	copyright: "Copyright (c) 1984-2017, Eiffel Software"
	license: "GPL version 2 (see http://www.eiffel.com/licensing/gpl.txt)"
	licensing_options: "http://www.eiffel.com/licensing"
	copying: "[
			This file is part of Eiffel Software's Eiffel Development Environment.
			
			Eiffel Software's Eiffel Development Environment is free
			software; you can redistribute it and/or modify it under
			the terms of the GNU General Public License as published
			by the Free Software Foundation, version 2 of the License
			(available at the URL listed under "license" above).
			
			Eiffel Software's Eiffel Development Environment is
			distributed in the hope that it will be useful, but
			WITHOUT ANY WARRANTY; without even the implied warranty
			of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
			See the GNU General Public License for more details.
			
			You should have received a copy of the GNU General Public
			License along with Eiffel Software's Eiffel Development
			Environment; if not, write to the Free Software Foundation,
			Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
		]"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"
end -- class EB_METRIC_RESULT_AREA

