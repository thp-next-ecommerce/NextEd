# frozen_string_literal: true

# == Schema Information
#
# Table name: students
#
#  id         :bigint(8)        not null, primary key
#  first_name :string
#  last_name  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :student do
    first_name { "First Name" }
    last_name { "Last Name" }

    trait :sections do
      sections { create_list(:section, 2) }
    end

    trait :groups do
      groups { create_list(:group, 2) }
    end
  end
end
