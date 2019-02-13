# frozen_string_literal: true

class AddReferencesToSkill < ActiveRecord::Migration[5.2]
  def change
    add_reference :skills, :domain, foreign_key: true
  end
end
