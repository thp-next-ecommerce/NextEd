# frozen_string_literal: true

class CreateWorkSessionSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :work_session_skills do |t|
      t.references :work_session, foreign_key: true
      t.references :skill, foreign_key: true

      t.timestamps
    end
  end
end
