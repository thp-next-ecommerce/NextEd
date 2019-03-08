# frozen_string_literal: true

# == Schema Information
#
# Table name: skills
#
#  id          :bigint(8)        not null, primary key
#  name        :string           not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  domain_id   :bigint(8)
#

class Skill < ApplicationRecord
  belongs_to :domain
  has_many :work_session_skills, dependent: :destroy
  has_many :work_sessions, through: :work_session_skills
  has_many :skill_student, dependent: :destroy
  has_many :students, through: :skill_student
  validates :name, presence: true
  validates :description, presence: true
  default_scope { order(:id) }
end
