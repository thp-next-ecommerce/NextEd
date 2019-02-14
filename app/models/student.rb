# frozen_string_literal: true

class Student < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
end
