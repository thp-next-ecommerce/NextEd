# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StudentWorkSessionsController, type: :controller do
  describe "POST #update" do
    let(:sws) { create(:student_work_session) }

    context "when student is late" do
      before do
        sws.attended = false
        post :update, params: {
          id: sws.work_session_id,
          student_work_session: {
            late: sws.id
          }
        }
      end

      it "changes 'late' column to true" do
        expect(sws.reload.late).to be true
      end

      it "changes 'attended' column to true" do
        expect(sws.reload.attended).to be true
      end
    end
  end
end
