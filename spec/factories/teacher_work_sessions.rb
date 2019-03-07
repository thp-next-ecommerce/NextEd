# frozen_string_literal: true

# == Schema Information
#
# Table name: teacher_work_sessions
#
#  id              :bigint(8)        not null, primary key
#  teacher_id      :bigint(8)
#  work_session_id :bigint(8)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

FactoryBot.define do
  factory :teacher_work_session do
    teacher
    work_session
  end
end
