# frozen_string_literal: true

Rails.application.routes.draw do
  resources :cultures, only: %i[index show edit update]
  resources :domains, only: %i[index show edit update]
  resources :lessons
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :skills
end
