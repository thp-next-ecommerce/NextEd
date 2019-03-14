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

    context "when student is medical" do
      before do
        sws.attended = true
        post :update, params: {
          id: sws.work_session_id,
          student_work_session: {
            medical: sws.id
          }
        }
      end

      it "changes 'medical' column to true" do
        expect(sws.reload.medical).to be true
      end
    end

    context "when student is suspended" do
      before do
        sws.attended = true
        post :update, params: {
          id: sws.work_session_id,
          student_work_session: {
            suspended: sws.id
          }
        }
      end

      it "changes 'suspended' column to true" do
        expect(sws.reload.suspended).to be true
      end

      it "changes 'attended' column to false" do
        expect(sws.reload.attended).to be false
      end
    end

    context "when student is no more late" do
      before do
        sws.attended = true
        sws.late = true
        post :update, params: {
          id: sws.work_session_id,
          student_work_session: {
            "!late": sws.id
          }
        }
      end

      it "changes 'late' column back to false" do
        expect(sws.reload.late).to be false
      end
    end

    context "when student is no more in medical" do
      before do
        sws.attended = true
        sws.medical = true
        post :update, params: {
          id: sws.work_session_id,
          student_work_session: {
            "!medical": sws.id
          }
        }
      end

      it "changes 'late' column back to false" do
        expect(sws.reload.late).to be false
      end
    end

    context "when student is no more suspended" do
      before do
        sws.attended = true
        sws.suspended = true
        post :update, params: {
          id: sws.work_session_id,
          student_work_session: {
            "!suspended": sws.id
          }
        }
      end

      it "changes 'late' column back to false" do
        expect(sws.reload.late).to be false
      end
    end
  end
end
