class AddApplicationToAppStatus < ActiveRecord::Migration
  def change
  	add_reference :app_statuses, :student_application, index: true
    add_foreign_key :app_statuses, :student_applications
  end
end
