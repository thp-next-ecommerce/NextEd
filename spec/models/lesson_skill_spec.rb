# frozen_string_literal: true

# == Schema Information
#
# Table name: lesson_skills
#
#  id         :bigint(8)        not null, primary key
#  lesson_id  :bigint(8)
#  skill_id   :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe LessonSkill, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
