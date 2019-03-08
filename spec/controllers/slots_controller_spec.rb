# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SlotsController, type: :controller do
  let(:slot) { create(:slot) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, params: { id: slot.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    subject(:create) { post :create, params: { slot: attributes_for(:slot) } }

    it "creates a slot" do
      expect{ post :create, params: { slot: attributes_for(:slot) } }.to change(Slot, :count).by(1)
    end
    it "redirects to the index of slots" do
      expect(create).to redirect_to slots_path
    end
    it "does not create a slot on failure" do
      expect{ post :create, params: { slot: { name: nil } } }.to change(Slot, :count).by(0)
    end
    it "redirects to #new on failure" do
      post :create, params: { slot: { name: nil, start_time: nil, end_time: nil } }
      expect(response).to render_template(:new)
    end
  end

  describe 'PATCH#update' do
    start_time = Time.zone.now
    end_time = Time.zone.now + 3300
    let(:update) { patch :update, params: { id: slot.id, slot: { name: "test update", start_time: start_time, end_time: end_time } } }
    let(:wrong_update) { patch :update, params: { id: slot.id, slot: { name: nil, start_time: nil, end_time: nil } } }

    describe 'with correct data' do
      before do
        slot
        update
      end

      it 'updates the slot name' do
        expect(slot.reload.name).to eq "test update"
      end

      it 'updates the slot start' do
        expect(slot.reload.start_time.strftime("%T")).to eq start_time.strftime("%T")
      end

      it 'updates the slot end' do
        expect(slot.reload.end_time.strftime("%T")).to eq end_time.strftime("%T")
      end

      it 'redirects to the slots index' do
        expect(update).to redirect_to slots_path
      end

      it 'displays a flash notice' do
        expect(controller).to set_flash[:notice]
      end
    end

    describe 'with wrong data' do
      before do
        wrong_update
        slot
      end

      it 'redirects to #edit on failure' do
        expect(response).to render_template(:edit)
      end

      it 'displays flash alert' do
        expect(controller).to set_flash[:alert]
      end
    end
  end
end
