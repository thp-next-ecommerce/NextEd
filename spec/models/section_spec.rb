# frozen_string_literal: true

# == Schema Information
#
# Table name: sections
#
#  id          :bigint(8)        not null, primary key
#  year        :integer          not null
#  level       :integer          not null
#  sub_section :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Section, type: :model do
  describe 'model instanciation,' do
    subject { described_class.new }

    describe 'database' do
      it { is_expected.to have_db_column(:year).of_type(:integer) }
      it { is_expected.to have_db_column(:level).of_type(:integer) }
      it { is_expected.to have_db_column(:sub_section).of_type(:string) }
    end

    describe 'validation' do
      it { is_expected.to validate_presence_of(:year) }
      it { is_expected.to validate_presence_of(:level) }
      it { is_expected.to validate_presence_of(:sub_section) }
    end

    describe 'associations' do
      let(:section) { create(:section) }

      it { is_expected.to have_many(:students) }
      it "responds to #students" do
        expect(section.students).to be_truthy
      end

      it "follows association links from #section back to itself" do
        section.students << create(:student)
        expect(section.students.first.sections.first).to eq section
      end
    end
  end
end
