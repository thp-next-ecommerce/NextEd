# frozen_string_literal: true

class CreateWorkSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :work_sessions do |t|
      t.date :date, null: false
      t.string :daily_schedule

      t.timestamps
    end
  end
end
