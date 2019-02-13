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

require 'rails_helper'

RSpec.describe Lesson, type: :model do
  describe 'database' do
    it { is_expected.to have_db_column(:date).of_type(:date).with_options(null: false) }
    it { is_expected.to have_db_column(:daily_schedule).of_type(:string) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
  end
end
