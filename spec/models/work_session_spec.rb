# frozen_string_literal: true

# == Schema Information
#
# Table name: work_sessions
#
#  id              :bigint(8)        not null, primary key
#  date            :date             not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  scholar_year_id :bigint(8)
#  slot_id         :bigint(8)
#

require 'rails_helper'

RSpec.describe WorkSession, type: :model do
  describe 'model instanciation,' do
    describe 'database' do
      it { is_expected.to have_db_column(:date).of_type(:date).with_options(null: false) }
      it { is_expected.to have_db_column(:slot_id).of_type(:integer) }
      it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
      it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
    end

    describe 'validation' do
      it { is_expected.to validate_presence_of(:date) }
    end

    describe 'associations' do
      let(:work_session) { create(:work_session) }

      it { is_expected.to have_many(:skills) }
      it "responds to #skills" do
        expect(work_session.skills).to be_truthy
      end

      it "follows association links from #skills back to itself" do
        work_session.skills << create(:skill)
        expect(work_session.skills.first.work_sessions.first).to eq work_session
      end

      it { is_expected.to have_many(:students) }
      it "responds to #students" do
        expect(work_session.students).to be_truthy
      end

      it "follows association links from #students back to itself" do
        work_session.students << create(:student)
        expect(work_session.students.first.work_sessions.first).to eq work_session
      end

      it { is_expected.to have_many(:teachers) }
      it "responds to #teachers" do
        expect(work_session.teachers).to be_truthy
      end

      it "follows association links from #teachers back to itself" do
        work_session.teachers << create(:teacher)
        expect(work_session.teachers.first.work_sessions.first).to eq work_session
      end

      it { is_expected.to have_many(:subjects) }
      it "responds to #subjects" do
        expect(work_session.subjects).to be_truthy
      end

      it "follows association links from #subjects back to itself" do
        work_session.subjects << create(:subject)
        expect(work_session.subjects.first.work_sessions.first).to eq work_session
      end
    end
  end
end
