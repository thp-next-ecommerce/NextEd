# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "students/show", type: :view do
  before do
    assign(:student, create(:student, :sections))
    assign(:skills, create_list(:skill, 2))
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
