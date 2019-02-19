# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "students/edit", type: :view do
  let(:student) {
    assign(:student, Student.create!(
                       first_name: "MyString",
                       last_name: "MyString"
                     ))
  }

  before do @student = student end

  it "renders the edit student form" do
    render

    assert_select "form[action=?][method=?]", student_path(student.id), "post" do
      assert_select "input[name=?]", "student[first_name]"

      assert_select "input[name=?]", "student[last_name]"
    end
  end
end
