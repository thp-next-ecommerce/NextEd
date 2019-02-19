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
    subject(:create) { post :create, params: { work_session: attributes_for(:work_session) } }

    it "creates a record" do
      expect{ post :create, params: { work_session: attributes_for(:work_session) } }.to change(WorkSession, :count).by(1)
    end

    it "redirects to the created work_session" do
      expect(create).to redirect_to work_session_path(WorkSession.last.id)
    end

    it "does not create a record on failure" do
      expect{ post :create, params: { work_session: { date: nil } } }.to change(WorkSession, :count).by(0)
    end

    it "redirects to #new on failure" do
      post :create, params: { work_session: { date: nil } }
      expect(response).to render_template(:new)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, params: { id: work_session.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT #update" do
    subject(:update) { put :update, params: { id: work_session.id, work_session: { date: Date.tomorrow } } }

    it "updates the passed values" do
      work_session
      update
      expect(work_session.reload.date).to eq Date.tomorrow
    end

    it "redirects to the created work_session" do
      expect(update).to redirect_to work_session_path(work_session.id)
    end

    it "redirects to #edit on failure" do
      put :update, params: { id: work_session.id, work_session: { date: nil } }
      expect(response).to render_template(:edit)
    end
  end

  describe "DELETE #destroy" do
    subject(:destroy) { delete :destroy, params: { id: work_session.id } }

    it "deletes the record" do
      work_session
      expect { delete :destroy, params: { id: work_session.id } }.to change(WorkSession, :count).by(-1)
    end

    it "redirects to #index" do
      expect(destroy).to redirect_to work_sessions_path
    end
  end
end
