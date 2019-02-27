# frozen_string_literal: true

class AddYearEndInSections < ActiveRecord::Migration[5.2]
  def change
    add_column :sections, :year_end, :integer
  end
end
