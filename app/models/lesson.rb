# frozen_string_literal: true

# == Schema Information
#
# Table name: lessons
#
#  id             :bigint(8)        not null, primary key
#  date           :date             not null
#  daily_schedule :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Lesson < ApplicationRecord
end
