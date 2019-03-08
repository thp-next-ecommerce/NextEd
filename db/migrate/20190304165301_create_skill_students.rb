# frozen_string_literal: true

class CreateSkillStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :skill_students do |t|
      t.references :skill, foreign_key: true
      t.references :student, foreign_key: true
      t.references :section, foreign_key: true

      t.timestamps
    end
  end
end
