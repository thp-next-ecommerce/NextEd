# frozen_string_literal: true

# == Schema Information
#
# Table name: section_students
#
#  id         :bigint(8)        not null, primary key
#  section_id :bigint(8)
#  student_id :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :section_student do
    section
    student
  end
end
