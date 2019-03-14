# frozen_string_literal: true

# == Schema Information
#
# Table name: slots
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  start_time :time
#  end_time   :time
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Slot < ApplicationRecord
  validates :name, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validate :overlap?
  validate :cannot_end_before_start, if: :time_present?

  has_many :work_sessions, dependent: :destroy

  default_scope { order(:id) }
  scope :between, ->(start_time, end_time) { where('end_time > ? AND start_time < ?', start_time, end_time) }

  private

  def overlap?
    errors.add(:base, "Slots cannot overlaps") if Slot.between(start_time, end_time).where.not(id: id).any?
  end

  def cannot_end_before_start
    raise ArgumentError unless start_time && end_time

    errors.add(:end_time, "cannot be before starting time") if end_time < start_time
  end

  def time_present?
    start_time.presence && end_time.presence
  end
end
