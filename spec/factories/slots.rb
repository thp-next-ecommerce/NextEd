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
    name { "MySlot" }
    start_time { 1.hour.from_now }
    end_time { 2.hours.from_now }
  end
end
