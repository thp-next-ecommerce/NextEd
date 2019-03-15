# frozen_string_literal: true

class ImportSkillsJob < ApplicationJob
  queue_as :default

  def import(skill_array)
    skill_array.each do |row_and_index|
      # row_and_index is the csv row and its associated line
      skill = Skill.new(row_and_index[0])
      skill.save
      if !skill.save
        # if the worker fail to create a skill, we store the error with its associated error description
        ImportError.create(line: row_and_index[1], error_entries: row_and_index[0].to_a, data_type: "Skills", error_type: "Doublon")
      end
    end
  end

  def perform(skill_array)
    import(skill_array)
  end
end
