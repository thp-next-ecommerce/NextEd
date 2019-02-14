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
  has_many :lesson_skills, dependent: :destroy
  has_many :lessons, through: :lesson_skills
  validates :name, presence: true
  validates :description, presence: true
end
