# frozen_string_literal: true

class ImportReportController < ApplicationController
  def report
    @import = ImportError.all
    @skills_errors = @import.all.where(data_type: "Skills")
    @students_errors = @import.all.where(data_type: "Students")
  end
end
