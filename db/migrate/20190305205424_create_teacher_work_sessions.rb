# frozen_string_literal: true

class CreateTeacherWorkSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :teacher_work_sessions do |t|
      t.references :teacher, foreign_key: true
      t.references :work_session, foreign_key: true

      t.timestamps
    end
  end
end
