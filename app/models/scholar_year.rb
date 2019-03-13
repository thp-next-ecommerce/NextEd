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
  before_save :set_current_year

  has_many :sections, dependent: :destroy
  has_many :work_sessions, dependent: :destroy
  has_many :groups, dependent: :destroy

  validate :overlap?
  validate :cannot_end_before_start

  scope :current_year, -> { where(current: true) }
  scope :passed, -> { where(current: false) }
  scope :between, ->(start_date, end_date) { where('end_date > ? AND start_date < ?', start_date, end_date) }

  def self.up_to_date?
    ScholarYear.between(Time.zone.today, Time.zone.today).any?
  end

  private

  def set_current_year
    if Time.zone.today.between?(start_date, end_date)
      ScholarYear.current_year.update(current: false)
      self.current = true
    else
      self.current = false
    end
  end

  def overlap?
    errors.add(:base, "Years cannot overlaps") if ScholarYear.between(start_date, end_date).where.not(id: id).any?
  end

  def cannot_end_before_start
    errors.add(:end_date, "cannot be before starting date") if end_date < start_date
  end
end
