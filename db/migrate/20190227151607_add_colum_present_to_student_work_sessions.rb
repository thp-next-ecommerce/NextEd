class AddColumPresentToStudentWorkSessions < ActiveRecord::Migration[5.2]
  def change
    add_column :student_work_sessions, :present, :boolean, default: false
  end
end
