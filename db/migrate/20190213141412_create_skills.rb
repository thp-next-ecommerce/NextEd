# frozen_string_literal: true

class CreateSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :skills do |t|
      t.string :name, null: false
      t.text :description, null: false

      t.timestamps
    end
  end
end
