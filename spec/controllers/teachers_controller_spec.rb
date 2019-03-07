# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TeachersController, type: :controller do
  let(:valid_attributes) {
    attributes_for(:teacher)
  }

  let(:invalid_attributes) {
    {
      first_name: '',
      last_name: ''
    }
  }

  let(:teacher) { create(:teacher) }

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: { id: teacher.to_param }
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
      get :edit, params: { id: teacher.to_param }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Teacher" do
        expect {
          post :create, params: { teacher: valid_attributes }
        }.to change(Teacher, :count).by(1)
      end

      it "redirects to the created teacher" do
        post :create, params: { teacher: valid_attributes }
        expect(response).to redirect_to(Teacher.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { teacher: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { last_name: 'New Name' }
      }

      it "updates the requested teacher" do
        put :update, params: { id: teacher.to_param, teacher: new_attributes }
        teacher.reload
        expect(teacher.last_name).to eq "New Name"
      end

      it "redirects to the teacher" do
        put :update, params: { id: teacher.to_param, teacher: valid_attributes }
        expect(response).to redirect_to(teacher)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        put :update, params: { id: teacher.to_param, teacher: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested teacher" do
      teacher
      expect {
        delete :destroy, params: { id: teacher.to_param }
      }.to change(Teacher, :count).by(-1)
    end

    it "redirects to the teachers list" do
      delete :destroy, params: { id: teacher.to_param }
      expect(response).to redirect_to(teachers_url)
    end
  end
end
