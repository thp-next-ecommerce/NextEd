# frozen_string_literal: true

class Slot < ApplicationRecord
  has_many :work_sessions, dependent: :destroy
end
