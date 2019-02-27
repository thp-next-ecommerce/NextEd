# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "StudentsToWorkSessions", type: :feature, js: true do
  let(:student) {
    create(:student, sections: [
             create(:section,
                    level: 6,
                    sub_section: "A")
           ])
  }

  it "shows a list of students from the section search" do
    visit 'work_sessions/new'
    click_link 'Classe'
    click_link '6th section'
    first :link, '6-A'
    expect(page).to have_content 'First Name'
  end
end
