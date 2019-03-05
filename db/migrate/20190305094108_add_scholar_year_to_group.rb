class AddScholarYearToGroup < ActiveRecord::Migration[5.2]
  def change
    add_reference :groups, :scholar_year, foreign_key: true
  end
end
