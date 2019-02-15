# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LessonsController, type: :controller do
  let(:lesson) { create(:lesson) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, params: { id: lesson.id }
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
    subject(:create) { post :create, params: { lesson: attributes_for(:lesson) } }

    it "creates a record" do
      expect{ post :create, params: { lesson: attributes_for(:lesson) } }.to change(Lesson, :count).by(1)
    end

    it "redirects to the created lesson" do
      expect(create).to redirect_to lesson_path(Lesson.last.id)
    end

    it "does not create a record on failure" do
      expect{ post :create, params: { lesson: { date: nil } } }.to change(Lesson, :count).by(0)
    end

    it "redirects to #new on failure" do
      post :create, params: { lesson: { date: nil } }
      expect(response).to render_template(:new)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, params: { id: lesson.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT #update" do
    subject(:update) { put :update, params: { id: lesson.id, lesson: { date: Date.tomorrow } } }

    it "updates the passed values" do
      lesson
      update
      expect(lesson.reload.date).to eq Date.tomorrow
    end

    it "redirects to the created lesson" do
      expect(update).to redirect_to lesson_path(lesson.id)
    end

    it "redirects to #edit on failure" do
      put :update, params: { id: lesson.id, lesson: { date: nil } }
      expect(response).to render_template(:edit)
    end
  end

  describe "DELETE #destroy" do
    subject(:destroy) { delete :destroy, params: { id: lesson.id } }

    it "deletes the record" do
      lesson
      expect { delete :destroy, params: { id: lesson.id } }.to change(Lesson, :count).by(-1)
    end

    it "redirects to #index" do
      expect(destroy).to redirect_to lessons_path
    end
  end
end
