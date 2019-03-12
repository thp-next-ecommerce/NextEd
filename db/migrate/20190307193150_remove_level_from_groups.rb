# frozen_string_literal: true

class RemoveLevelFromGroups < ActiveRecord::Migration[5.2]
  def change
    remove_column :groups, :level, :integer
  end
end
