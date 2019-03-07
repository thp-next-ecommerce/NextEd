# frozen_string_literal: true

# == Schema Information
#
# Table name: students
#
#  id         :bigint(8)        not null, primary key
#  first_name :string
#  last_name  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  has_many :section_students, dependent: :destroy
  has_many :sections, through: :section_students
  has_many :group_students, dependent: :destroy
  has_many :groups, through: :group_students
  has_many :student_work_sessions, dependent: :destroy
  has_many :work_sessions, through: :student_work_sessions
  has_many :skill_students, dependent: :destroy
  has_many :skills, through: :skill_students
  default_scope { order(last_name: :asc) }

  accepts_nested_attributes_for :student_work_sessions

  paginates_per 25

  def skills_with_sections
    data = {}
    skill_ids = skill_students.map(&:skill).uniq
    skill_ids.each do |skill|
      data[skill] = skill_students.where(skill_id: skill).map(&:section)
    end
    data
  end
end
