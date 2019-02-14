# frozen_string_literal: true

# == Schema Information
#
# Table name: cultures
#
#  id          :bigint(8)        not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Culture < ApplicationRecord
  has_many :domains, dependent: :destroy
  validates :name, presence: true
end
