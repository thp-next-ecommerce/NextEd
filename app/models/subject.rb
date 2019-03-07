# frozen_string_literal: true

# == Schema Information
#
# Table name: subjects
#
#  id          :bigint(8)        not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Subject < ApplicationRecord
  validates :name, presence: true
  has_many :work_session_subjects, dependent: :destroy
  has_many :work_sessions, through: :work_session_subjects
end
