# frozen_string_literal: true

class CreateStudentWorkSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :student_work_sessions do |t|
      t.references :student, foreign_key: true
      t.references :work_session, foreign_key: true

      t.timestamps
    end
  end
end
