class AddFk < ActiveRecord::Migration
  def change
    add_column :student_applications, :student_id, :integer
    add_index :student_applications, :student_id, :unique => true
  end
end
