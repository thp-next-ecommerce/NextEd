# frozen_string_literal: true

class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.date :date, null: false
      t.string :daily_schedule

      t.timestamps
    end
  end
end
