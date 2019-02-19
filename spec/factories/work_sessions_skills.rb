# frozen_string_literal: true

# == Schema Information
#
# Table name: work_session_skills
#
#  id         :bigint(8)        not null, primary key
#  work_session_id  :bigint(8)
#  skill_id   :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :work_session_skill do
    work_session { nil }
    skill { nil }
  end
end
