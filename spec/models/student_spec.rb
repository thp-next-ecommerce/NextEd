# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Student, type: :model do
  describe 'Model instantiation' do
    subject(:new_student) { described_class.new }

    describe 'Database of Student' do
      it { is_expected.to have_db_column(:id).of_type(:integer) }
      it { is_expected.to have_db_column(:first_name).of_type(:string) }
      it { is_expected.to have_db_column(:last_name).of_type(:string) }
    end
  end

  context 'when testing validations' do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
  end
end
