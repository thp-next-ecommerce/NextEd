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
      render 'search_section'

    # Group search
    elsif params[:group].present?
      @group = Group.find(params[:group])
      @students = @group.students
      render 'search_group'

    # Name search
    elsif params[:student].present?
      @students = Student.select { |student|
        (student.last_name.upcase.start_with?(params[:student].upcase) ||
        student.first_name.upcase.start_with?(params[:student].upcase) )
      }
      render 'search_name'
    end
  end
end
