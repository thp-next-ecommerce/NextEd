# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'lessons#index'
  resources :cultures, only: %i[index show edit update]
  resources :domains, only: %i[index show edit update]
  resources :lessons
  get 'lessons/:id/roll_call', to: 'lessons#roll_call', as: 'lesson_roll_call'
  resources :skills
end
