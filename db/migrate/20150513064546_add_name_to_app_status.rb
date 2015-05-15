class AddNameToAppStatus < ActiveRecord::Migration
  def change
  	add_column :app_statuses, :student_name, :string
  end
end
