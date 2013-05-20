-- This file has been generated by EWG. Do not edit. Changes will be lost!

class TXNATSUIVARIATIONS_STRUCT

inherit

	EWG_STRUCT

	TXNATSUIVARIATIONS_STRUCT_EXTERNAL
		export
			{NONE} all
		end

create

	make_new_unshared,
	make_new_shared,
	make_unshared,
	make_shared

feature {ANY} -- Access

	sizeof: INTEGER is
		do
			Result := sizeof_external
		end

feature {ANY} -- Member Access

	variationcount: INTEGER is
			-- Access member `variationCount'
		require
			exists: exists
		do
			Result := get_variationcount_external (item)
		ensure
			result_correct: Result = get_variationcount_external (item)
		end

	set_variationcount (a_value: INTEGER) is
			-- Set member `variationCount'
		require
			exists: exists
		do
			set_variationcount_external (item, a_value)
		ensure
			a_value_set: a_value = variationcount
		end

	variationaxis: POINTER is
			-- Access member `variationAxis'
		require
			exists: exists
		do
			Result := get_variationaxis_external (item)
		ensure
			result_correct: Result = get_variationaxis_external (item)
		end

	set_variationaxis (a_value: POINTER) is
			-- Set member `variationAxis'
		require
			exists: exists
		do
			set_variationaxis_external (item, a_value)
		ensure
			a_value_set: a_value = variationaxis
		end

	variationvalues: POINTER is
			-- Access member `variationValues'
		require
			exists: exists
		do
			Result := get_variationvalues_external (item)
		ensure
			result_correct: Result = get_variationvalues_external (item)
		end

	set_variationvalues (a_value: POINTER) is
			-- Set member `variationValues'
		require
			exists: exists
		do
			set_variationvalues_external (item, a_value)
		ensure
			a_value_set: a_value = variationvalues
		end

end