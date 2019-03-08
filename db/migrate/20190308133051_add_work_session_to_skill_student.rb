# frozen_string_literal: true

class AddWorkSessionToSkillStudent < ActiveRecord::Migration[5.2]
  def change
    add_column :skill_students, :work_session_id, :integer
  end
end
