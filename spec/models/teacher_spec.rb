# frozen_string_literal: true

# == Schema Information
#
# Table name: teachers
#
#  id         :bigint(8)        not null, primary key
#  first_name :string
#  last_name  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Teacher, type: :model do
  describe 'database' do
    it { is_expected.to have_db_column(:first_name).of_type(:string) }
    it { is_expected.to have_db_column(:last_name).of_type(:string) }
  end

  describe 'validation' do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
  end

  describe 'associations' do
    let(:teacher) { create(:teacher) }

    it { is_expected.to have_many(:work_sessions) }
    it "responds to #work_sessions" do
      expect(teacher.work_sessions).to be_truthy
    end

    it "follows association links from #work_sessions back to itself" do
      teacher.work_sessions << create(:work_session)
      expect(teacher.work_sessions.first.teachers.first).to eq teacher
    end
  end
end
