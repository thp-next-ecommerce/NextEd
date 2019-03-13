# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WorkSessionsController, type: :controller do
  let(:work_session) { create(:work_session) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, params: { id: work_session.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    subject(:create_request) { post :create, params: { work_session: attributes_for(:work_session, slot_id: slot.id) } }

    let(:slot) { create(:slot) }
    let!(:scholar_year) { create(:scholar_year) }

    context "when only date and schedule are set (basic)" do
      it "creates a record" do
        expect{ post :create, params: { work_session: attributes_for(:work_session, slot_id: slot.id) } }.to change(WorkSession, :count).by(1)
      end
      it "redirects to the created work_session" do
        expect(create_request).to redirect_to work_session_path(WorkSession.last.id)
      end
      it "does not create a record on failure" do
        expect{ post :create, params: { work_session: { date: nil } } }.to change(WorkSession, :count).by(0)
      end
      it "redirects to #new on failure" do
        post :create, params: { work_session: { date: nil } }
        expect(response).to render_template(:new)
      end
    end

    it "associates skills to a session" do
      post :create, params: { work_session: attributes_for(:work_session, :skills, slot_id: slot.id, scholar_year: scholar_year) }
      expect(WorkSession.last.skills.count).to eq 3
    end

    it "associates students to a session" do
      post :create, params: { work_session: attributes_for(:work_session, :students, slot_id: slot.id, scholar_year: scholar_year) }
      expect(WorkSession.last.students.count).to eq 3
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, params: { id: work_session.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT #update" do
    subject(:update) { put :update, params: { id: work_session.id, work_session: { date: Date.current } } }

    it "updates the passed values" do
      work_session
      update
      expect(work_session.reload.date).to eq Date.current
    end

    it "redirects to the updated work_session" do
      expect(update).to redirect_to work_session_path(work_session.id)
    end

    it "redirects to #edit on failure" do
      put :update, params: { id: work_session.id, work_session: { date: Date.yesterday } }
      expect(response).to redirect_to work_session_path(work_session.id)
    end
  end
end
