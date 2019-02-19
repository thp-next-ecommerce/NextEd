# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'model instanciation,' do
    describe 'database' do
      it { is_expected.to have_db_column(:name).of_type(:string) }
      it { is_expected.to have_db_column(:level).of_type(:integer) }
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
        group.students << create(:section)
        expect(group.students.first.groups.first).to eq group
      end
    end
  end
end
