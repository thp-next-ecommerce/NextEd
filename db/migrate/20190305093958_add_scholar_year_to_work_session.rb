class AddScholarYearToWorkSession < ActiveRecord::Migration[5.2]
  def change
    add_reference :work_sessions, :scholar_year, foreign_key: true
  end
end
