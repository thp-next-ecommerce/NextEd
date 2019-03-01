# frozen_string_literal: true

# == Schema Information
#
# Table name: student_work_sessions
#
#  id              :bigint(8)        not null, primary key
#  student_id      :bigint(8)
#  work_session_id :bigint(8)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  attended        :boolean          default(FALSE)
#

class StudentWorkSession < ApplicationRecord
  belongs_to :student
  belongs_to :work_session

  validates :present, default: false
  scope :has_attended, lambda { where(attended: true) }
  scope :not_attended, lambda { where(attended: false) }
end
