# frozen_string_literal: true

# == Schema Information
#
# Table name: import_errors
#
#  id            :bigint(8)        not null, primary key
#  error_entries :string           not null
#  line          :string           not null
#  error_type    :string           not null
#  data_type     :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class ImportError < ApplicationRecord
  serialize :error_entries, Array
end
