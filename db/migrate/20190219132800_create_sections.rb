# frozen_string_literal: true

class CreateSections < ActiveRecord::Migration[5.2]
  def change
    create_table :sections do |t|
      t.integer :year, null: false
      t.integer :level, null: false
      t.string :sub_section, null: false

      t.timestamps
    end
  end
end
