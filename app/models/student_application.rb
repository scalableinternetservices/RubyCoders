class StudentApplication < ActiveRecord::Base
  belongs_to :Student
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

  # all fields must be filled
  validates :name, :phone, :email_id, :gpa, :address, :city, :state, :country, :dob, presence: true
  validates :resume, :sop, :lor, attachment_size: { less_than: 5.megabytes }

  # Phone should be a number and its length should be between 10 and 15 characters
  validates :phone,  :numericality => true,
                     :length => { :minimum => 10, :maximum => 15 }

  # Validate email using the regex provided by Devise
  validates_format_of :email_id,:with => Devise::email_regexp, :uniqueness => true

# check if GPA lies in the correct range
  validates :gpa, :numericality => { less_than_or_equal_to:4.0, greater_than_or_equal_to: 2.5 }

  #validates :dob, date: { before: Date.today }

# Validate Address

# File Uploads

has_attached_file :resume, :url  => "/resumes/:id/:filename"
validates_attachment_content_type :resume, :content_type => %w(application/pdf)

has_attached_file :sop, :url  => "/sops/:id/:filename"
validates_attachment_content_type :sop, :content_type => %w(application/pdf)

has_attached_file :lor, :url  => "/lors/:id/:filename"
validates_attachment_content_type :lor, :content_type => %w(application/pdf)

end
