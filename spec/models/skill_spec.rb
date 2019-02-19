# frozen_string_literal: true

# == Schema Information
#
# Table name: skills
#
#  id          :bigint(8)        not null, primary key
#  name        :string           not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  domain_id   :bigint(8)
#

require 'rails_helper'

RSpec.describe Skill, type: :model do
  describe "model instanciation," do
    describe 'Database' do
      subject(:new_skill) { described_class.new }

      it { is_expected.to have_db_column(:id).of_type(:integer).with_options(null: false) }
      it { is_expected.to have_db_column(:name).of_type(:string).with_options(null: false) }
      it { is_expected.to have_db_column(:description).of_type(:text).with_options(null: false) }
    end

    describe 'validation' do
      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to validate_presence_of(:description) }
    end

    describe 'association' do
      let(:skill) { create(:skill) }

      it { is_expected.to have_many(:work_sessions) }
      it "responds to #work_sessions" do
        expect(skill.work_sessions).to be_truthy
      end

      it "follows association links from #work_sessions back to itself" do
        skill.work_sessions << create(:work_session)
        expect(skill.work_sessions.first.skills.first).to eq skill
      end
    end
  end
end
