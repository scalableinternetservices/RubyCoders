json.array!(@student_applications) do |student_application|
  json.extract! student_application, :id, :student_id, :name, :phone, :email_id, :gpa
  json.url student_application_url(student_application, format: :json)
end
