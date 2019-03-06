# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SubjectsController, type: :controller do
  let(:valid_attributes) {
    attributes_for(:subject)
  }

  let(:invalid_attributes) {
    {
      name: '',
      description: ''
    }
  }

  let(:session_subject) { create(:subject) }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      Subject.create! valid_attributes
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: { id: session_subject.to_param }
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      get :edit, params: { id: session_subject.to_param }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Subject" do
        expect {
          post :create, params: { subject: valid_attributes }
        }.to change(Subject, :count).by(1)
      end

      it "redirects to the created subject" do
        post :create, params: { subject: valid_attributes }
        expect(response).to redirect_to(Subject.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { subject: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { name: 'New Name' }
      }

      it "updates the requested subject" do
        put :update, params: { id: session_subject.to_param, subject: new_attributes }
        session_subject.reload
        expect(session_subject.name).to eq "New Name"
      end

      it "redirects to the subject" do
        put :update, params: { id: session_subject.to_param, subject: valid_attributes }
        expect(response).to redirect_to(session_subject)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        put :update, params: { id: session_subject.to_param, subject: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested subject" do
      session_subject
      expect {
        delete :destroy, params: { id: session_subject.to_param }
      }.to change(Subject, :count).by(-1)
    end

    it "redirects to the subjects list" do
      delete :destroy, params: { id: session_subject.to_param }
      expect(response).to redirect_to(subjects_url)
    end
  end
end
