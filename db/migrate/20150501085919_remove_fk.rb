class RemoveFk < ActiveRecord::Migration
  def change
    remove_column :student_applications, :Student_id
  end
end
