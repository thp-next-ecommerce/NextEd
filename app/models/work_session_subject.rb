# frozen_string_literal: true

# == Schema Information
#
# Table name: work_session_subjects
#
#  id              :bigint(8)        not null, primary key
#  work_session_id :bigint(8)
#  subject_id      :bigint(8)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class WorkSessionSubject < ApplicationRecord
  belongs_to :work_session
  belongs_to :subject
end
