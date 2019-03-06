# frozen_string_literal: true

class AddSlotToWorkSessions < ActiveRecord::Migration[5.2]
  def change
    add_reference :work_sessions, :slot, index: true
  end
end
