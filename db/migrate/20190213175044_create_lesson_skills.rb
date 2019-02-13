# frozen_string_literal: true

class CreateLessonSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :lesson_skills do |t|
      t.references :lesson, foreign_key: true
      t.references :skill, foreign_key: true

      t.timestamps
    end
  end
end
