# frozen_string_literal: true

class Section < ApplicationRecord
  validates :year, presence: true
  validates :level, presence: true
  validates :sub_section, presence: true
end
