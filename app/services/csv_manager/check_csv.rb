# frozen_string_literal: true

module CsvManager
  class CheckCsv
    def self.check_students(csv_file)
      # Reset error report page
      ImportError.delete_all
      #### read uploaded file / prepare data for the worker #####

      # correct lines will go in this array
      students_array = []
      # bogus lines will go in this array
      errors_array = []
      # CSV gem has some error management but we needed more
      # index "i" helps us tracking errors by saving the line where the error occured
      CSV.foreach(csv_file.path, headers: true).with_index(1) do |row, i|
        # Skips line if a field is blank to avoid an import error. Error is appended to errors_array with index
        next errors_array << [row.to_h, i] if row.to_h.value?(nil)

        # Formats both keys and values by removing whitespaces (which would results in an error) and capitalizing the values
        students_array << [row.to_h.map{ |k, v| [k.gsub(/\s+/, ''), v.gsub(/\s+/, '').capitalize] }.to_h, i]
      end
      # Sends both the students and errors to the ImportStudent service
      # Sending arrays instead of the file because to be used, the file must be saved somewhere (ActiveStorage for example)
      CsvManager::ImportStudent.add_to_db(students_array, errors_array)
    end

    def self.check_skills(csv_file)
      # Same logic as the method above
      ImportError.delete_all
      skills_array = []
      errors_array = []
      CSV.foreach(csv_file.path, headers: true).with_index(1) do |row, i|
        next errors_array << [row.to_h, i] if row.to_h.value?(nil)

        skills_array << [row.to_h.map{ |k, v| [k.gsub(/\s+/, ''), v.capitalize] }.to_h, i]
      end
      CsvManager::ImportSkill.add_to_db(skills_array, errors_array)
    end
  end
end
