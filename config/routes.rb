# frozen_string_literal: true

Rails.application.routes.draw do
  resources :students
  get 'search', to: 'students#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'work_sessions#index'
  resources :cultures, only: %i[index show edit update]
  resources :domains, only: %i[index show edit update]
  resources :work_sessions
  get 'work_sessions/:id/roll_call', to: 'work_sessions#roll_call', as: 'work_session_roll_call'
  resources :skills
end
