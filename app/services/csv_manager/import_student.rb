# frozen_string_literal: true

module CsvManager
  class ImportStudent
    def self.add_to_db(students_array, errors_array)
      # Saves each line with errors in DB
      errors_array.each do |error|
        # error is an array of the CSV line with errors and the number of the line ([[line], [line_number]])
        ImportError.create(line: error[1], error_entries: error[0].to_a, data_type: "Students", error_type: "Formatage")
      end
      # Sends the array of valid students to a job
      ImportStudentsJob.perform_later(students_array)
    end
  end
end
