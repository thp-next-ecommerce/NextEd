# frozen_string_literal: true

class AddScholarYearToSection < ActiveRecord::Migration[5.2]
  def change
    add_reference :sections, :scholar_year, foreign_key: true
  end
end
