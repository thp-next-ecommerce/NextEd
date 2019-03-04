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

class SkillStudent < ApplicationRecord
  belongs_to :skill
  belongs_to :student
  belongs_to :section
end
