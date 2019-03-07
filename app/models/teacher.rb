# frozen_string_literal: true

# == Schema Information
#
# Table name: teachers
#
#  id         :bigint(8)        not null, primary key
#  first_name :string
#  last_name  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Teacher < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  has_many :teacher_work_sessions, dependent: :destroy
  has_many :work_sessions, through: :teacher_work_sessions
end
