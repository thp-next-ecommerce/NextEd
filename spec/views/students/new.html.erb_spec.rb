# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "students/new", type: :view do
  before do
    assign(:student, Student.new(
                       first_name: "MyString",
                       last_name: "MyString"
                     ))
  end

  it "renders new student form" do
    render

    assert_select "form[action=?][method=?]", students_path, "post" do
      assert_select "input[name=?]", "student[first_name]"

      assert_select "input[name=?]", "student[last_name]"
    end
  end
end
