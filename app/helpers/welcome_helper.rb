module WelcomeHelper
	def show_map
		@student_applications = StudentApplication.all
	end
	
	def about
	end

	def contact
	end
	
	def decision_made
		@student_application = StudentApplication.find_by student_id: current_student.id

		@app_status = AppStatus.find_by student_application_id: @student_application
		if @app_status.status != nil 
			@decision_made = true
		else
			@decision_made = false
		end
	end

	def decision
		@student_application = StudentApplication.find_by student_id: current_student.id

		@app_status = AppStatus.find_by student_application_id: @student_application
		if @app_status.status == 1 
			@decision = true
		else
			@decision = false
		end
	end
end
