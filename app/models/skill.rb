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
#

class Skill < ApplicationRecord
end
