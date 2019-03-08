# frozen_string_literal: true

# == Schema Information
#
# Table name: work_sessions
#
#  id              :bigint(8)        not null, primary key
#  date            :date             not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  scholar_year_id :bigint(8)
#  slot_id         :bigint(8)
#

class WorkSession < ApplicationRecord
  validates :date, presence: true
  has_many :work_session_skills, dependent: :destroy
  has_many :skills, through: :work_session_skills
  has_many :student_work_sessions, dependent: :destroy
  has_many :students, through: :student_work_sessions
  belongs_to :slot
  has_many :teacher_work_sessions, dependent: :destroy
  has_many :teachers, through: :teacher_work_sessions
  has_many :work_session_subjects, dependent: :destroy
  has_many :subjects, through: :work_session_subjects
  belongs_to :scholar_year
end
