# frozen_string_literal: true

class UpdateSkillStudentsJob < ApplicationJob
  queue_as :default

  def perform(ws_id)
    SkillStudentsUpdater.new(ws_id).perform
  end
end
