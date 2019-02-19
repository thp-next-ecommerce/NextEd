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

require 'rails_helper'

RSpec.describe GroupStudent, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
