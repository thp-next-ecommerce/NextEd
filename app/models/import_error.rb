# frozen_string_literal: true

class ImportError < ApplicationRecord
  serialize :error_entries, Array
end
