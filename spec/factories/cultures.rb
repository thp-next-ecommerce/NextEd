# frozen_string_literal: true

# == Schema Information
#
# Table name: cultures
#
#  id          :bigint(8)        not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryBot.define do
  factory :culture do
    name { "MyString" }
    description { "Description" }
  end
end
