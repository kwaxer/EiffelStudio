deferred class FILED_STONE 

inherit

	STONE
		undefine
			header
		redefine
			is_valid
		end
	
feature 

	file_name: STRING is deferred end;
			-- Name of the file which parsing led to the creation of current AST node

	set_file_name (s: STRING) is deferred end;
			-- Assign `s' to `file_name'.

	origin_text: STRING is
			-- Content of the file named `file_name';
			-- Void if unreadable file
		local
			a_file: RAW_FILE
		do
			!!a_file.make (file_name);
			if a_file.exists and then a_file.is_readable then
				a_file.open_read;
				a_file.readstream (a_file.count);
				a_file.close;
				Result := a_file.laststring
			end
		end

feature -- Status report

	is_valid: BOOLEAN is
			-- Is `Current' a valid stone?
		do
			Result := file_name /= Void
		ensure then
			Result implies file_name /= Void
		end;

end
