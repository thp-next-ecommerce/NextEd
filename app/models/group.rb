# frozen_string_literal: true

class Group < ApplicationRecord
  validates :name, presence: true
end
