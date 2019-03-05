# frozen_string_literal: true

# == Schema Information
#
# Table name: work_session_subjects
#
#  id              :bigint(8)        not null, primary key
#  work_session_id :bigint(8)
#  subject_id      :bigint(8)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe WorkSessionSubject, type: :model do
  describe 'database' do
    it { is_expected.to have_db_column(:work_session_id).of_type(:integer) }
    it { is_expected.to have_db_column(:subject_id).of_type(:integer) }
  end

  describe 'asscociations' do
    let(:work_session_subject) { create(:work_session_subject) }

    it { is_expected.to belong_to(:subject) }
    it { is_expected.to belong_to(:work_session) }

    it 'responds to #subjects' do
      expect(work_session_subject.subject).to be_truthy
    end

    it 'responds to #work_session' do
      expect(work_session_subject.work_session).to be_truthy
    end
  end
end
