class AddAttachmentSopLorToStudentApplications < ActiveRecord::Migration
  def self.up
    change_table :student_applications do |t|
      t.attachment :sop
      t.attachment :lor
    end
  end

  def self.down
    remove_attachment :student_applications, :sop
    remove_attachment :student_applications, :lor
  end
end
