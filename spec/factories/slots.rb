# frozen_string_literal: true

# == Schema Information
#
# Table name: slots
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  start_time :time
#  end_time   :time
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


FactoryBot.define do
  factory :slot do
    name { "MyString" }
    start_time { "2019-03-05 17:03:30" }
    end_time { "2019-03-05 17:03:30" }
  end
end
