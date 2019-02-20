# frozen_string_literal: true

# == Schema Information
#
# Table name: sections
#
#  id          :bigint(8)        not null, primary key
#  year        :integer          not null
#  level       :integer          not null
#  sub_section :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Section < ApplicationRecord
  validates :year, presence: true
  validates :level, presence: true
  validates :sub_section, presence: true
  has_many :section_students, dependent: :destroy
  has_many :students, through: :section_students
end
