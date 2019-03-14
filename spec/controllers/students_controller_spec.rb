# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StudentsController, type: :controller do
  let(:valid_attributes) {
    attributes_for(:student)
  }

  let(:invalid_attributes) {
    {
      first_name: '',
      last_name: ''
    }
  }

  let(:student) { create(:student) }

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: { id: student.to_param }
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
      get :edit, params: { id: student.to_param }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Student" do
        expect {
          post :create, params: { student: valid_attributes }
        }.to change(Student, :count).by(1)
      end

      it "redirects to the created student" do
        post :create, params: { student: valid_attributes }
        expect(response).to redirect_to(Student.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { student: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { last_name: 'New Name' }
      }

      it "updates the requested student" do
        put :update, params: { id: student.to_param, student: new_attributes }
        student.reload
        expect(student.last_name).to eq "New Name"
      end

      it "redirects to the student" do
        put :update, params: { id: student.to_param, student: valid_attributes }
        expect(response).to redirect_to(student)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        put :update, params: { id: student.to_param, student: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested student" do
      student
      expect {
        delete :destroy, params: { id: student.to_param }
      }.to change(Student, :count).by(-1)
    end

    it "redirects to the students list" do
      delete :destroy, params: { id: student.to_param }
      expect(response).to redirect_to(students_url)
    end
  end
end
