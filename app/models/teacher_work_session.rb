# frozen_string_literal: true

# == Schema Information
#
# Table name: teacher_work_sessions
#
#  id              :bigint(8)        not null, primary key
#  teacher_id      :bigint(8)
#  work_session_id :bigint(8)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class TeacherWorkSession < ApplicationRecord
  belongs_to :teacher
  belongs_to :work_session
end
