# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "students/index", type: :view do
  before do
    assign(:students, [
             Student.create!(
               first_name: "First Name",
               last_name: "Last Name"
             ),
             Student.create!(
               first_name: "First Name",
               last_name: "Last Name"
             )
           ])
  end

  it "renders a list of students" do
    render
    assert_select "tr>td", text: "First Name".to_s, count: 2
    assert_select "tr>td", text: "Last Name".to_s, count: 2
  end
end
