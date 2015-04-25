class StudentApplication < ActiveRecord::Base
  belongs_to :Student

  # all fields must be filled
  validates :name, :phone, :email_id, :gpa, presence: true


  # Phone should be a number and its length should be between 10 and 15 characters
  validates :phone,  :numericality => true,
                     :length => { :minimum => 10, :maximum => 15 }

  # Validate email using the regex provided by Devise
  validates_format_of :email_id,:with => Devise::email_regexp, :uniqueness => true

# check if GPA lies in the correct range
  validates :gpa, :numericality => { less_than_or_equal_to:4.0, greater_than_or_equal_to: 2.5 }
end