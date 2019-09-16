note
	description: "Summary description for {ESA_CJ_USER_RESPONSIBLE_PAGE}."
	date: "$Date$"
	revision: "$Revision$"

class
	CJ_USER_RESPONSIBLE

inherit

	TEMPLATE_USER_HOST
		rename
			make as make_template
		end

create
	make

feature {NONE} --Initialization

	make (a_host: READABLE_STRING_GENERAL; a_list: LIST [USER]; a_user: detachable ANY)
			-- Initialize `Current'.
		do
			debug
				log.write_information (generator + ".make render template: cj_user_responsibe.tpl")
			end
				-- Set template to CJ
			set_template_folder (cj_path)
				-- Build common template
			make_template (a_host, a_user, "cj_user_responsible.tpl" )
				-- Custom property
			template.add_value (a_list, "users")
				-- Process current template
			process
		end
end
