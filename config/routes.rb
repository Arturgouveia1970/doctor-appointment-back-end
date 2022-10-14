# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :users, only: [:index, :show, :edit, :create, :update, :destroy, :doctors] do
        resources :appointments
          
      end
      resources :doctors do
        
        resources :appointments
      end  
    end       

  end

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :appointments, only: [:index, :show, :edit, :create, :update, :destroy, :doctors]
    end
  end
 
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :specialities, only: [:index, :show, :edit, :create, :update, :destroy, :doctors]
    end
  end

  # Defines the root path route ("/")
  # root "articles#index"
end
