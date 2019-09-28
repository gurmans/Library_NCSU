json.extract! student, :id, :name, :passwrod, :email, :bookmarks, :created_at, :updated_at
json.url student_url(student, format: :json)
