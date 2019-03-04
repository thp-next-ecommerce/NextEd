# frozen_string_literal: true

# == Schema Information
#
# Table name: skill_students
#
#  id         :bigint(8)        not null, primary key
#  skill_id   :bigint(8)
#  student_id :bigint(8)
#  section_id :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe SkillStudent, type: :model do
  describe 'Model instanciation,' do
    describe 'Database' do
      it { is_expected.to have_db_column(:id).of_type(:integer).with_options(null: false) }
      it { is_expected.to have_db_column(:skill_id).of_type(:integer) }
      it { is_expected.to have_db_column(:student_id).of_type(:integer) }
      it { is_expected.to have_db_column(:section_id).of_type(:integer) }
      it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
      it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
    end
    
    describe 'Associations' do
      it { is_expected.to belong_to(:skill) }
      it { is_expected.to belong_to(:student) }
      it { is_expected.to belong_to(:section) }
    end
  end
end
