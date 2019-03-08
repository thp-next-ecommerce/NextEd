# frozen_string_literal: true

class CreateWorkSessionSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :work_session_subjects do |t|
      t.references :work_session, foreign_key: true
      t.references :subject, foreign_key: true

      t.timestamps
    end
  end
end
