# frozen_string_literal: true

# == Schema Information
#
# Table name: group_students
#
#  id         :bigint(8)        not null, primary key
#  student_id :bigint(8)
#  group_id   :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :group_student do
    student
    group
  end
end
