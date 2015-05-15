class AddLocationToStudentApplication < ActiveRecord::Migration
  def change
    add_column :student_applications, :address, :string
    add_column :student_applications, :city, :string
    add_column :student_applications, :state, :string
    add_column :student_applications, :country, :string
    add_column :student_applications, :dob, :date
    add_column :student_applications, :latitude, :float
    add_column :student_applications, :longitude, :float
  end
end
