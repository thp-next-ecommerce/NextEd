# frozen_string_literal: true

json.extract! student, :id, :first_name, :last_name, :created_at, :updated_at
json.url student_url(student, format: :json)
