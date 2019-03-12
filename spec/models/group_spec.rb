# frozen_string_literal: true

# == Schema Information
#
# Table name: groups
#
#  id              :bigint(8)        not null, primary key
#  name            :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  scholar_year_id :bigint(8)
#

require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'model instanciation,' do
    describe 'database' do
      it { is_expected.to have_db_column(:name).of_type(:string) }
    end

    describe 'validation' do
      it { is_expected.to validate_presence_of(:name) }
    end

    describe 'associations' do
      let(:group) { create(:group) }

      it { is_expected.to have_many(:students) }
      it "responds to #students" do
        expect(group.students).to be_truthy
      end

      it "follows association links from #students back to itself" do
        group.students << create(:student)
        expect(group.students.first.groups.first).to eq group
      end

      it { is_expected.to belong_to(:scholar_year) }
      it "responds to #scholar_year" do
        expect(group.scholar_year).to be_truthy
      end
    end
  end
end
