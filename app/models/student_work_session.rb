# frozen_string_literal: true

# == Schema Information
#
# Table name: student_work_sessions
#
#  id              :bigint(8)        not null, primary key
#  student_id      :bigint(8)
#  work_session_id :bigint(8)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  attended        :boolean          default(TRUE)
#  suspended       :boolean          default(FALSE)
#  medical         :boolean          default(FALSE)
#  late            :boolean          default(FALSE)
#

class StudentWorkSession < ApplicationRecord
  before_update :update_attended_status_if_needed
  belongs_to :student
  belongs_to :work_session

  scope :has_attended, lambda { where(attended: true) }
  scope :not_attended, lambda { where(attended: false) }
  #validate :check_student_status

  def update_attended_status_if_needed
    self.attended = true if self.late
    self.attended = false if self.suspended
  end

  def check_student_status

    if self.late == self.medical || self.late == self.suspended || self.suspended == self.medical
      errors.add(:base, "Sélectionner une seul options: en retard, nurserie ou exclus" )
      puts "---------"
      puts self.errors.full_messages
    end
  end

end
