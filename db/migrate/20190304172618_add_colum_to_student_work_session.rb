# frozen_string_literal: true

class AddColumToStudentWorkSession < ActiveRecord::Migration[5.2]
  def change
    change_table :student_work_sessions, bulk: true do |t|
      t.boolean :suspended, default: false
      t.boolean :medical, default: false
      t.boolean :late, default: false
    end
  end
end
