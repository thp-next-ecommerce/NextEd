# frozen_string_literal: true

module StudentSearch
  extend ActiveSupport::Concern

  def search
    # Section search
    if params[:level].present? && params[:sub_section].present?
      @students = Student.select { |student|
        (student.sections.last.sub_section == params[:sub_section] &&
        student.sections.last.level == params[:level].to_i)
      }

    # Group search
    elsif params[:group].present?
      if params[:group] == "yes"
        @groups = Group.select { |group|
          (group.level == params[:level].to_i)
        }
      else
        @group = Group.find(params[:group])
        @students = @group.students
      end

    # Name search
    elsif params[:student].present?
      @students = Student.select { |student|
        (student.last_name.upcase.start_with?(params[:student].upcase) ||
        student.first_name.upcase.start_with?(params[:student].upcase) )
      }
    end
  end
end
