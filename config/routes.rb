# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get 'users/sign_out' => 'devise/sessions#destroy'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :foods, except: :update
  resources :recipes, except: :update
  resources :public_recipes
  resources :general_shopping_list

  root 'recipes#index'
end
