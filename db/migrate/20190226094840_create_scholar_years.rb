# frozen_string_literal: true

class CreateScholarYears < ActiveRecord::Migration[5.2]
  def change
    create_table :scholar_years do |t|
      t.date :start_date
      t.date :end_date
      t.boolean :current, default: false

      t.timestamps
    end
  end
end
