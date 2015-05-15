module StudentApplicationsHelper
	def admitted
		@student_applications = StudentApplication.all

		@app_id = params[:student_application_id]
		@reviewer_id = params[:reviewer_id]

		AppStatus.where(student_application_id: @app_id).limit(1).update_all(status: 'true', reviewer_id: @reviewer_id)
	end

	def rejected
		@student_applications = StudentApplication.all

		@app_id = params[:student_application_id]
		@reviewer_id = params[:reviewer_id]

		AppStatus.where(student_application_id: @app_id).limit(1).update_all(status: 'false', reviewer_id: @reviewer_id)
	end

end
