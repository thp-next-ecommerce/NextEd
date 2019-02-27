# frozen_string_literal: true

class RenameYearInSections < ActiveRecord::Migration[5.2]
  def change
    rename_column :sections, :year, :year_start
  end
end
