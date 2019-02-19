# frozen_string_literal: true

# == Schema Information
#
# Table name: students
#
#  id         :bigint(8)        not null, primary key
#  first_name :string
#  last_name  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Student, type: :model do
  describe 'model instanciation,' do
    describe 'database' do
      it { is_expected.to have_db_column(:first_name).of_type(:string) }
      it { is_expected.to have_db_column(:last_name).of_type(:string) }
    end

    describe 'validation' do
      it { is_expected.to validate_presence_of(:first_name) }
      it { is_expected.to validate_presence_of(:last_name) }
    end

    describe 'associations' do
      let(:student) { create(:student) }

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
