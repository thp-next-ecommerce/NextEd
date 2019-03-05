# frozen_string_literal: true
# == Schema Information
#
# Table name: groups
#
#  id              :bigint(8)        not null, primary key
#  name            :string           not null
#  level           :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  scholar_year_id :bigint(8)
#

class Group < ApplicationRecord
  validates :name, presence: true
  has_many :group_students, dependent: :destroy
  has_many :students, through: :group_students
  belongs_to :scholar_year
end
