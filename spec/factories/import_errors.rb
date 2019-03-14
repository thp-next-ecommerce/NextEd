# frozen_string_literal: true

FactoryBot.define do
  factory :import_error do
    error_entries { ["MyString"] }
    line { "MyString" }
    error_type { "MyString" }
    data_type { "MyString" }
  end
end
