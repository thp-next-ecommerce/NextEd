# frozen_string_literal: true

# == Schema Information
#
# Table name: section_students
#
#  id         :bigint(8)        not null, primary key
#  section_id :bigint(8)
#  student_id :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class SectionStudent < ApplicationRecord
  belongs_to :section
  belongs_to :student
end
