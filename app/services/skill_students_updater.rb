# frozen_string_literal: true

class SkillStudentsUpdater
  def initialize(ws_id)
    @work_session_id = ws_id
    @skills = WorkSession.find(ws_id).skills.pluck(:id)
  end

  def retrieve_attendance
    StudentWorkSession.where(work_session_id: @work_session_id).has_attended.map(&:student).map{ |student| [student.id, student.sections.last.id] }
  end

  def update_skills(attendees)
    @skills.each do |skill|
      attendees.each do |student, section|
        SkillStudent.find_or_create_by(student_id: student, section_id: section, skill_id: skill, work_session_id: @work_session_id)
      end
    end
  end

  def perform
    attendees = retrieve_attendance
    update_skills(attendees)
  end
end
