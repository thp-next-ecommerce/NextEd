# frozen_string_literal: true

# == Schema Information
#
# Table name: scholar_years
#
#  id         :bigint(8)        not null, primary key
#  start_date :date
#  end_date   :date
#  current    :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :scholar_year do
    year_start { "" }
    year_end { "" }
  end
end
