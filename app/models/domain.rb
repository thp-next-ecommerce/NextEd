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

class Domain < ApplicationRecord
  belongs_to :culture
  has_many :skills, dependent: :destroy
  validates :name, presence: true
end
