# frozen_string_literal: true

# == Schema Information
#
# Table name: work_sessions
#
#  id              :bigint(8)        not null, primary key
#  date            :date             not null
#  daily_schedule  :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  scholar_year_id :bigint(8)
#

FactoryBot.define do
  factory :work_session do
    date { Date.tomorrow }
    daily_schedule { "MyString" }
    scholar_year

    trait :skills do
      skills { create_list(:skill, 3) }
    end

    trait :skill_ids do
      skill_ids { create_list(:skill, 3).pluck(:id) }
    end

    trait :students do
      students { create_list(:student, 3) }
    end

    factory :work_session_with_skills, traits: [:skill_ids]
  end
end
