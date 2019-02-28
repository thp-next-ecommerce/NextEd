# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "StudentsToWorkSessions", type: :feature, js: true do
  let(:student) {
    create(:student,
           sections: [
             create(:section, level: 6, sub_section: "A")
           ],
           groups: [
             create(:group, level: 6)
           ])
  }

  before {
    student
    visit 'work_sessions/new'
  }

  describe "student search" do
    it "shows a list of students from the section search" do
      click_link 'Classe'
      2.times { click_link '6th-section' }
      click_link '6-A'
      expect(page).to have_content 'First Name'
    end

    context "when searching a group" do
      before {
        click_link 'Groupe'
        2.times { click_link '6e' }
      }

      it "shows a list of groups from the group search" do
        expect(page).to have_content 'MyGroup'
      end

      it "clicking a group shows the students list of that group" do
        click_link 'MyGroup'
        expect(page).to have_content 'First Name'
      end
    end

    it "shows a list of names from the name search" do
      click_link 'Nom'
      fill_in('student', with: 'First')
      click_link 'Rechercher'
      expect(page).to have_content 'First Name'
    end
  end

  describe "student association to a work_session" do
    it "associates the correct number of students" do
      fill_in 'work_session_date', with: Date.tomorrow
      click_link 'Nom'; fill_in('student', with: 'First'); click_link 'Rechercher'
      click_button 'Create Work session'
      expect(page).to have_content('First Name', count: 1)
    end
  end
end
