# frozen_string_literal: true

class SkillStudentsUpdater
  def initialize(ws_id)
    @work_session_id = ws_id
    @skills = WorkSession.find(ws_id).skills.pluck(:id)
  end

  def retrieve_attendance
    StudentWorkSession.where(work_session_id: @work_session_id).pluck(:student_id, :attended).map{ |x| [Student.find(x[0]), x[1]] }.map{ |y| [y[0].id, y[0].sections.last.id, y[1]] }
  end

  def add_skill(student, skill, section, ws_id)
    SkillStudent.find_or_create_by!(student_id: student, section_id: section, skill_id: skill, work_session_id: ws_id)
  end

  def remove_skill(student, skill, ws_id)
    SkillStudent.find_by(student_id: student, skill_id: skill, work_session_id: ws_id)&.destroy
  end

  def update_skills(attendees)
    @skills.each do |skill|
      attendees.each do |student, section, attended|
        attended ? add_skill(student, skill, section, @work_session_id) : remove_skill(student, skill, @work_session_id)
      end
    end
  end

  def perform
    attendees = retrieve_attendance
    update_skills(attendees)
  end
end
