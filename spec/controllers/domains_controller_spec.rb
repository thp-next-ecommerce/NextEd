# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DomainsController, type: :controller do
  let(:domain) { create(:domain) }
  let(:culture) { create(:culture) }

  describe "GET #show" do
    it "returns http success" do
      get :show, params: { id: domain.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, params: { id: domain.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'PATCH#update' do
    let(:wrong_update) { patch :update, params: { id: domain.id, domain: { name: nil, culture_id: nil } } }

    let(:update) { patch :update, params: { id: domain.id, domain: { name: "test update", culture_id: culture.id } } }

    describe 'with correct data' do
      before do
        domain
        update
      end

      it 'updates the values' do
        expect(domain.reload.name).to eq "test update"
      end

      it 'redirects to the created domain' do
        expect(update).to redirect_to domain_path(domain.id)
      end
      it 'displays a flash notice' do
        expect(controller).to set_flash[:notice]
      end
    end

    describe 'with wrong data' do
      before do
        wrong_update
        domain
      end

      it 'redirects to #edit on failure' do
        expect(response).to render_template(:edit)
      end

      it 'displays flash  alert' do
        expect(controller).to set_flash[:alert]
      end
    end
  end
end
