# frozen_string_literal: true

class LessonSkill < ApplicationRecord
  belongs_to :lesson
  belongs_to :skill
end
