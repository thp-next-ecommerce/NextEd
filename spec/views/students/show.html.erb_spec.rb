# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "students/show", type: :view do
  before do
    @student = assign(:student, Student.create!(
                                  first_name: "First Name",
                                  last_name: "Last Name"
                                ))
  end

  it "renders first_name attribute in <p>" do
    render
    expect(rendered).to match(/First Name/)
  end

  it "renders last_name attribute in <p>" do
    render
    expect(rendered).to match(/Last Name/)
  end
end
