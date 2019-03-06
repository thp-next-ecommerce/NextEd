# frozen_string_literal: true

# == Schema Information
#
# Table name: work_sessions
#
#  id             :bigint(8)        not null, primary key
#  date           :date             not null
#  daily_schedule :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class WorkSession < ApplicationRecord
  validates :date, presence: true
  has_many :work_session_skills, dependent: :destroy
  has_many :skills, through: :work_session_skills
  has_many :student_work_sessions, dependent: :destroy
  has_many :students, through: :student_work_sessions
  has_many :teacher_work_sessions, dependent: :destroy
  has_many :teachers, through: :teacher_work_sessions
  has_many :work_session_subjects, dependent: :destroy
  has_many :subjects, through: :work_session_subjects

  default_scope { order({ date: :desc }, :daily_schedule) }
end
