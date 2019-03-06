# frozen_string_literal: true
# == Schema Information
#
# Table name: work_sessions
#
#  id         :bigint(8)        not null, primary key
#  date       :date             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slot_id    :bigint(8)
#

FactoryBot.define do
  factory :work_session do
    date { Date.tomorrow }
    slot

    trait :skills do
      skill_ids { create_list(:skill, 3) }
    end

    trait :students do
      student_ids { create_list(:student, 3) }
    end
  end
end
