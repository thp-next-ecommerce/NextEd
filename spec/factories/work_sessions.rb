# frozen_string_literal: true

# == Schema Information
#
# Table name: work_sessions
#
#  id              :bigint(8)        not null, primary key
#  date            :date             not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  scholar_year_id :bigint(8)
#  slot_id         :bigint(8)
#

FactoryBot.define do
  factory :work_session do
    date { Date.tomorrow }
    scholar_year
    association :slot, factory: :slot

    trait :skills do
      skill_ids { create_list(:skill, 3).pluck(:id) }
    end

    trait :students do
      student_ids { create_list(:student, 3).pluck(:id) }
    end

    factory :work_session_with_skills, traits: [:skills]
    factory :work_session_with_students, traits: [:students]
  end
end
