# frozen_string_literal: true

# == Schema Information
#
# Table name: student_work_sessions
#
#  id              :bigint(8)        not null, primary key
#  student_id      :bigint(8)
#  work_session_id :bigint(8)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

FactoryBot.define do
  factory :student_work_session do
    student
    work_session
    attended { false }
  end
end
