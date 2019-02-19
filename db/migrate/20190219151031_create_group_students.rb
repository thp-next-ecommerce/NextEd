# frozen_string_literal: true

class CreateGroupStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :group_students do |t|
      t.references :student, foreign_key: true
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end
