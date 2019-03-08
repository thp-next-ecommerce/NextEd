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

require 'rails_helper'

RSpec.describe ScholarYear, type: :model do
  describe 'Model instanciation,' do
    describe 'Database' do
      it { is_expected.to have_db_column(:id).of_type(:integer).with_options(null: false) }
      it { is_expected.to have_db_column(:start_date).of_type(:date) }
      it { is_expected.to have_db_column(:end_date).of_type(:date) }
      it { is_expected.to have_db_column(:current).of_type(:boolean).with_options(default: false) }
      it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
      it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
    end

    describe 'Associations' do
      it { is_expected.to have_many(:sections) }
      it { is_expected.to have_many(:groups) }
      it { is_expected.to have_many(:work_sessions) }
    end
  end
end
