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

require 'rails_helper'

RSpec.describe Subject, type: :model do
  describe 'database' do
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:description).of_type(:text) }
  end

  describe 'validation' do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe 'associations' do
    let(:session_subject) { create(:subject) }

    it { is_expected.to have_many(:work_sessions) }
    it "responds to #work_sessions" do
      expect(session_subject.work_sessions).to be_truthy
    end

    it "follows association links from #work_sessions back to itself" do
      session_subject.work_sessions << create(:work_session)
      expect(session_subject.work_sessions.first.subjects.first).to eq session_subject
    end
  end
end
