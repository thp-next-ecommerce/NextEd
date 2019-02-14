# frozen_string_literal: true

Rails.application.routes.draw do
resources :culture, only: %i[index show edit update]
resources :domain, only: %i[index show edit update]
end
