# frozen_string_literal: true

# == Schema Information
#
# Table name: scholar_years
#
#  id         :bigint(8)        not null, primary key
#  start_date :date
#  end_date   :date
#  current    :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ScholarYear < ApplicationRecord
  has_many :sections, dependent: :destroy

  scope :active, -> { where(current: true) }
  scope :passed, -> { where(current: false) }

  def self.current_year
    return active.first if active.any?
  end
end
