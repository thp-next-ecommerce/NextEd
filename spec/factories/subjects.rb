# frozen_string_literal: true

# == Schema Information
#
# Table name: subjects
#
#  id          :bigint(8)        not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryBot.define do
  factory :subject do
    name { "MyString" }
    description { "MyText" }
  end
end
