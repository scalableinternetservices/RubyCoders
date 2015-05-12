class AddAttachmentResumeToStudentApplications < ActiveRecord::Migration
  def self.up
    change_table :student_applications do |t|
      t.attachment :resume
    end
  end

  def self.down
    remove_attachment :student_applications, :resume
  end
end
