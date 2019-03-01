# frozen_string_literal: true

class RenamePresentToAttended < ActiveRecord::Migration[5.2]
  def change
    rename_column :student_work_sessions, :present, :attended
  end
end
