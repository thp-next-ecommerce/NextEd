# frozen_string_literal: true

# == Schema Information
#
# Table name: work_session_skills
#
#  id              :bigint(8)        not null, primary key
#  work_session_id :bigint(8)
#  skill_id        :bigint(8)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class WorkSessionSkill < ApplicationRecord
  belongs_to :work_session
  belongs_to :skill
  # validates_uniqueness_of :skill_id, scope: :work_session_id
end
