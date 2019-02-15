# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SkillsController, type: :controller do
  let(:skill) { create(:skill) }
  let(:domain) { create(:domain) }
  let(:culture) { create(:culture) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, params: { id: skill.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, params: { id: skill.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'PATCH#update' do
    let(:wrong_update) { patch :update, params: { id: skill.id, skill: { name: nil, domain_id: nil } } }
    let(:update) { patch :update, params: { id: skill.id, skill: { name: "test update", description: "test description update", domain_id: domain.id } } }

    describe 'with correct data' do
      before do
        skill
        update
      end

      it 'updates the skill name' do
        expect(skill.reload.name).to eq "test update"
      end

      it 'updates the skill description' do
        expect(skill.reload.description).to eq "test description update"
      end

      it 'redirects to the created domain' do
        expect(update).to redirect_to skills_path
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

      it 'displays flash alert' do
        expect(controller).to set_flash[:alert]
      end
    end
  end
end
