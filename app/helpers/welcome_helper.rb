module WelcomeHelper
	def show_map
		@student_applications = StudentApplication.all
	end
end
