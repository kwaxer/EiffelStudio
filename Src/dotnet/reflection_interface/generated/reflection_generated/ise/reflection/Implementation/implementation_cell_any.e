indexing
	Generator: "Eiffel Emitter 3.1rc1"
	external_name: "Implementation.CELL_ANY"

external class
	IMPLEMENTATION_CELL_ANY

inherit
	SYSTEM_OBJECT
		redefine
			finalize,
			get_hash_code,
			equals,
			to_string
		end
	CELL_ANY

create
	make

feature {NONE} -- Initialization

	frozen make is
		external
			"IL creator use Implementation.CELL_ANY"
		end

feature -- Access

	frozen ec_illegal_36_ec_illegal_36_item: ANY is
		external
			"IL field signature :ANY use Implementation.CELL_ANY"
		alias
			"$$item"
		end

feature -- Basic Operations

	item: ANY is
		external
			"IL signature (): ANY use Implementation.CELL_ANY"
		alias
			"item"
		end

	deep_clone (other: ANY): ANY is
		external
			"IL signature (ANY): ANY use Implementation.CELL_ANY"
		alias
			"deep_clone"
		end

	get_hash_code: INTEGER is
		external
			"IL signature (): System.Int32 use Implementation.CELL_ANY"
		alias
			"GetHashCode"
		end

	tagged_out: STRING is
		external
			"IL signature (): STRING use Implementation.CELL_ANY"
		alias
			"tagged_out"
		end

	internal_clone: ANY is
		external
			"IL signature (): ANY use Implementation.CELL_ANY"
		alias
			"internal_clone"
		end

	operating_environment: OPERATING_ENVIRONMENT is
		external
			"IL signature (): OPERATING_ENVIRONMENT use Implementation.CELL_ANY"
		alias
			"operating_environment"
		end

	standard_is_equal (other: ANY): BOOLEAN is
		external
			"IL signature (ANY): System.Boolean use Implementation.CELL_ANY"
		alias
			"standard_is_equal"
		end

	is_equal_ (other: ANY): BOOLEAN is
		external
			"IL signature (ANY): System.Boolean use Implementation.CELL_ANY"
		alias
			"is_equal"
		end

	standard_equal (some: ANY; other: ANY): BOOLEAN is
		external
			"IL signature (ANY, ANY): System.Boolean use Implementation.CELL_ANY"
		alias
			"standard_equal"
		end

	same_type (other: ANY): BOOLEAN is
		external
			"IL signature (ANY): System.Boolean use Implementation.CELL_ANY"
		alias
			"same_type"
		end

	generator: STRING is
		external
			"IL signature (): STRING use Implementation.CELL_ANY"
		alias
			"generator"
		end

	internal_copy (o: ANY) is
		external
			"IL signature (ANY): System.Void use Implementation.CELL_ANY"
		alias
			"internal_copy"
		end

	standard_clone (other: ANY): ANY is
		external
			"IL signature (ANY): ANY use Implementation.CELL_ANY"
		alias
			"standard_clone"
		end

	equal_ (some: ANY; other: ANY): BOOLEAN is
		external
			"IL signature (ANY, ANY): System.Boolean use Implementation.CELL_ANY"
		alias
			"equal"
		end

	frozen a____class_name: SYSTEM_STRING is
		external
			"IL signature (): System.String use Implementation.CELL_ANY"
		alias
			"____class_name"
		end

	do_nothing is
		external
			"IL signature (): System.Void use Implementation.CELL_ANY"
		alias
			"do_nothing"
		end

	out_: STRING is
		external
			"IL signature (): STRING use Implementation.CELL_ANY"
		alias
			"out"
		end

	default_rescue is
		external
			"IL signature (): System.Void use Implementation.CELL_ANY"
		alias
			"default_rescue"
		end

	default_pointer: POINTER is
		external
			"IL signature (): System.IntPtr use Implementation.CELL_ANY"
		alias
			"default_pointer"
		end

	standard_copy (other: ANY) is
		external
			"IL signature (ANY): System.Void use Implementation.CELL_ANY"
		alias
			"standard_copy"
		end

	to_string: SYSTEM_STRING is
		external
			"IL signature (): System.String use Implementation.CELL_ANY"
		alias
			"ToString"
		end

	default_: ANY is
		external
			"IL signature (): ANY use Implementation.CELL_ANY"
		alias
			"default"
		end

	deep_equal (some: ANY; other: ANY): BOOLEAN is
		external
			"IL signature (ANY, ANY): System.Boolean use Implementation.CELL_ANY"
		alias
			"deep_equal"
		end

	equals (obj: SYSTEM_OBJECT): BOOLEAN is
		external
			"IL signature (System.Object): System.Boolean use Implementation.CELL_ANY"
		alias
			"Equals"
		end

	frozen ec_illegal_36_ec_illegal_36_put (current_: CELL_ANY; v: ANY) is
		external
			"IL static signature (CELL_ANY, ANY): System.Void use Implementation.CELL_ANY"
		alias
			"$$put"
		end

	generating_type: STRING is
		external
			"IL signature (): STRING use Implementation.CELL_ANY"
		alias
			"generating_type"
		end

	replace (v: ANY) is
		external
			"IL signature (ANY): System.Void use Implementation.CELL_ANY"
		alias
			"replace"
		end

	a_set_item (item2: ANY) is
		external
			"IL signature (ANY): System.Void use Implementation.CELL_ANY"
		alias
			"_set_item"
		end

	put (v: ANY) is
		external
			"IL signature (ANY): System.Void use Implementation.CELL_ANY"
		alias
			"put"
		end

	default_create_ is
		external
			"IL signature (): System.Void use Implementation.CELL_ANY"
		alias
			"default_create"
		end

	io: STD_FILES is
		external
			"IL signature (): STD_FILES use Implementation.CELL_ANY"
		alias
			"io"
		end

	clone_ (other: ANY): ANY is
		external
			"IL signature (ANY): ANY use Implementation.CELL_ANY"
		alias
			"clone"
		end

	deep_copy (other: ANY) is
		external
			"IL signature (ANY): System.Void use Implementation.CELL_ANY"
		alias
			"deep_copy"
		end

	copy_ (other: ANY) is
		external
			"IL signature (ANY): System.Void use Implementation.CELL_ANY"
		alias
			"copy"
		end

	conforms_to (other: ANY): BOOLEAN is
		external
			"IL signature (ANY): System.Boolean use Implementation.CELL_ANY"
		alias
			"conforms_to"
		end

	print (some: ANY) is
		external
			"IL signature (ANY): System.Void use Implementation.CELL_ANY"
		alias
			"print"
		end

	frozen ec_illegal_36_ec_illegal_36_replace (current_: CELL_ANY; v: ANY) is
		external
			"IL static signature (CELL_ANY, ANY): System.Void use Implementation.CELL_ANY"
		alias
			"$$replace"
		end

feature {NONE} -- Implementation

	finalize is
		external
			"IL signature (): System.Void use Implementation.CELL_ANY"
		alias
			"Finalize"
		end

end -- class IMPLEMENTATION_CELL_ANY
