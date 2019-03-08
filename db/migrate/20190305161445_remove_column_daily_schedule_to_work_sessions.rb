# frozen_string_literal: true

class RemoveColumnDailyScheduleToWorkSessions < ActiveRecord::Migration[5.2]
  def change
    remove_column :work_sessions, :daily_schedule, :string
  end
end
