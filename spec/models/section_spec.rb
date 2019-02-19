# frozen_string_literal: true

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

      skip
      # setup these tests when associating with lessons
      # it { is_expected.to have_many(:skills) }
      # it "responds to #skills" do
      #   expect(work_session.skills).to be_truthy
      # end

      # it "follows association links from #skills back to itself" do
      #   work_session.skills << create(:skill)
      #   expect(work_session.skills.first.work_sessions.first).to eq work_session
      # end
    end
  end
end
