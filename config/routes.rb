# frozen_string_literal: true

Rails.application.routes.draw do
  resources :students
  resources :subjects
  get 'search', to: 'students#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'work_sessions#index'
  resources :cultures, only: %i[index show edit update]
  resources :domains, only: %i[index show edit update]
  resources :work_sessions
  get 'work_sessions/:id/roll_call', to: 'student_work_sessions#roll_call', as: 'work_session_roll_call'
  post 'work_sessions/:id/roll_call', to: 'student_work_sessions#update', as: 'update_work_session_roll_call'
  resources :skills
  resources :scholar_years, only: %i[index edit update create]

  patch '/scholar_years/:id/archive', to: 'scholar_years#archive', as: 'archive_scholar_years'
  post '/scholar_years/:id/archive', to: 'scholar_years#archive'
end
