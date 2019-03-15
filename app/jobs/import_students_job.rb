# frozen_string_literal: true

class ImportStudentsJob < ApplicationJob
  queue_as :default

  def import(students_array)
    students_array.each do |row_and_index|
      # row_and_index is the csv row and its associated line
      student = Student.new(row_and_index[0])

      begin
        student.save!
      # if the worker fails to create a student, we store the error with its associated error description
      rescue StandardError => e
        puts e
        ImportError.create(line: row_and_index[1], error_entries: row_and_index[0].to_a, data_type: "Students", error_type: e)
      end
    end
  end

  def perform(students_array)
    import(students_array)
  end
end
