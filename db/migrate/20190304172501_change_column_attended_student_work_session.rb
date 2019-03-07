# frozen_string_literal: true

class ChangeColumnAttendedStudentWorkSession < ActiveRecord::Migration[5.2]
  def change
    change_column_default :student_work_sessions, :attended, from: false, to: true
  end
end
