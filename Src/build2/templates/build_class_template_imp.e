indexing
	description: "Objects that represent an EV_TITLED_WINDOW generated by EiffelBuild."
	date: "$Date$"
	revision: "$Revision$"

deferred class
	<CLASS_NAME>

<INHERITANCE>

feature {NONE} -- Initialization

	initialize is
			-- Initialize `Current'.
		<LOCAL>
		do
			<PRECURSOR>
			<CREATE>
			<BUILD>
			<SET>
			<EVENT_CONNECTION>

				-- Close the application when an interface close
				-- request is recieved on `Current'. i.e. the cross is clicked.
			--close_request_actions.extend (agent ((create {EV_ENVIRONMENT}).application).destroy)

				-- Call `user_initialization'.
			user_initialization
		end
<CUSTOM_FEATURE>

feature {NONE} -- Implementation

	is_in_default_state: BOOLEAN is
			-- Is `Current' in its default state?
		do
			-- Re-implement if you wish to enable checking
			-- for `Current'.
			Result := True
		end
	
	user_initialization is
			-- Feature for custom initialization, called at end of `initialize'.
		deferred
		end
	<ATTRIBUTE>
	<EVENT_DECLARATION>

end
