# frozen_string_literal: true

class ScholarYear < ApplicationRecord
  scope :active, -> { where(current: true) }
  scope :passed, -> { where(current: false) }

  def self.current_year
    return active.first if active.any?
  end
end
