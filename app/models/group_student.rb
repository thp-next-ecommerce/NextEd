# frozen_string_literal: true

# == Schema Information
#
# Table name: group_students
#
#  id         :bigint(8)        not null, primary key
#  student_id :bigint(8)
#  group_id   :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class GroupStudent < ApplicationRecord
  belongs_to :student
  belongs_to :group
end
