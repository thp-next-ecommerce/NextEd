# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SkillsController, type: :controller do
  let(:skill) { create(:skill) }

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
end
