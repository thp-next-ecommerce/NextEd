# frozen_string_literal: true

# == Schema Information
#
# Table name: teacher_work_sessions
#
#  id              :bigint(8)        not null, primary key
#  teacher_id      :bigint(8)
#  work_session_id :bigint(8)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe TeacherWorkSession, type: :model do
  describe 'database' do
    it { is_expected.to have_db_column(:teacher_id).of_type(:integer) }
    it { is_expected.to have_db_column(:work_session_id).of_type(:integer) }
  end

  describe 'asscociations' do
    let(:teacher_work_session) { create(:teacher_work_session) }

    it { is_expected.to belong_to(:teacher) }
    it { is_expected.to belong_to(:work_session) }

    it 'responds to #teachers' do
      expect(teacher_work_session.teacher).to be_truthy
    end

    it 'responds to #work_session' do
      expect(teacher_work_session.work_session).to be_truthy
    end
  end
end
