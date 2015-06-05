module StudentApplicationsHelper
	
	def cache_key_for_studentapplication_table
		"student_application-table-#{StudentApplication.maximum(:updated_at)}"
	end

	def cache_key_for_studentapplication_row(student_application)
		"student_application-#{student_application.id}-#{student_application.updated_at}"
	end

	def admitted
		@student_applications = StudentApplication.all

		@app_id = params[:student_application_id]
		@reviewer_id = params[:reviewer_id]

		AppStatus.where(student_application_id: @app_id).limit(1).update_all(status: 1, reviewer_id: @reviewer_id)
	end

	def rejected
		@student_applications = StudentApplication.all

		@app_id = params[:student_application_id]
		@reviewer_id = params[:reviewer_id]

		AppStatus.where(student_application_id: @app_id).limit(1).update_all(status: 0, reviewer_id: @reviewer_id)
	end

	
end
