class WelcomeController < ApplicationController
  include WelcomeHelper
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
    redirect_to :controller => "student_applications", :action => "show", :id => current_student.id

  end
  helper_method :redirecting_show

end
