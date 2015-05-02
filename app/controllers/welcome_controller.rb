class WelcomeController < ApplicationController
  def index
  end

  def no_application
    if StudentApplication.exists?(:student_id => current_student.id)
      @no_appln = false
    else
      @no_appln = true
    end
  end
  helper_method :no_application

  def redirecting_show
    redirect_to :controller => "student_applications", :action => "edit", :id => 1

  end
  helper_method :redirecting_show
end
