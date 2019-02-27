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
  validates :year_start, presence: true
  validates :year_end, presence: true
  validates :sub_section, presence: true
  has_many :section_students, dependent: :destroy
  has_many :students, through: :section_students

  validates :level, inclusion: { in: [6, 5, 4, 3] }, presence: true
  validates :sub_section, inclusion: { in: %w(A B C D E F G) }, presence: true

  def self.current_scholar_year
    if ScholarYear.current_year
      where("year_start = :start AND year_end = :end", start: ScholarYear.current_year.start_date.year, end: ScholarYear.current_year.end_date.year)
    else
      []
    end
  end

  def value
    "#{level}°#{sub_section}"
  end
end
