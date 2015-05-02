class CreateStudentApplications < ActiveRecord::Migration
  def change
    create_table :student_applications do |t|
      #t.belongs_to :Student, index: true
      t.string :name
      t.string :phone
      t.string :email_id
      t.decimal :gpa

      t.timestamps null: false
    end
    #add_foreign_key :student_applications, :Students
  end
end
