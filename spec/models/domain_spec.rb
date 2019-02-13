# frozen_string_literal: true

# == Schema Information
#
# Table name: domains
#
#  id          :bigint(8)        not null, primary key
#  name        :string
#  description :text
#  culture_id  :bigint(8)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Domain, type: :model do
  subject(:domain) { create(:domain) }

  let(:new_domain) { described_class.new }

  describe 'database' do
    it { is_expected.to have_db_column(:id).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_column(:name).of_type(:string).with_options(presence: true) }
    it { is_expected.to have_db_column(:description).of_type(:text) }
  end

  describe 'validation' do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe 'association' do
    it { is_expected.to belong_to(:culture) }
    it { is_expected.to have_many(:skills) }
  end

  it 'is creatable' do
    expect(domain.id).not_to be_nil
  end

  it 'is not valid without name' do
    expect(new_domain).not_to be_valid
  end
end
