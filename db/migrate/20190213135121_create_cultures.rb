# frozen_string_literal: true

class CreateCultures < ActiveRecord::Migration[5.2]
  def change
    create_table :cultures do |t|
      t.string :name
      t.text :description
      t.timestamps
    end
  end
end
