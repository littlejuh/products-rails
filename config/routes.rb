# frozen_string_literal: true

Rails.application.routes.draw do
  root "products#index"
  resources :products
  namespace :api do
    resources :products
  end
end

