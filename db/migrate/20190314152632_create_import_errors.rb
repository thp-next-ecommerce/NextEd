# frozen_string_literal: true

class CreateImportErrors < ActiveRecord::Migration[5.2]
  def change
    create_table :import_errors do |t|
      t.string :error_entries, null: false
      t.string :line, null: false
      t.string :error_type, null: false
      t.string :data_type, null: false

      t.timestamps
    end
  end
end
