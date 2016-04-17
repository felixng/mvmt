# Route prefixes use a single letter to allow for vanity urls of two or more characters
Rails.application.routes.draw do
  resources :brands
  resources :offers
  resources :ad_types
  resources :affiliates
  resources :products
  resources :categories
  resources :places

  if defined? Sidekiq
    require 'sidekiq/web'
    authenticate :user, lambda {|u| u.is_admin? } do
      mount Sidekiq::Web, at: '/admin/sidekiq/jobs', as: :sidekiq
    end
  end

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin' if defined? RailsAdmin

  # Static pages
  match '/error' => 'pages#error', via: [:get, :post], as: 'error_page'
  match '/disclosure' => 'pages#affiliate', via: [:get, :post], as: 'disclosure'
  get '/terms' => 'pages#terms', as: 'terms'
  get '/privacy' => 'pages#privacy', as: 'privacy'
  get '/about' => 'pages#about', as: 'about'
  get '/advertise' => 'pages#advertise', as: 'advertise'
  get '/contact' => 'pages#contact', as: 'contact'
  # get '/places' => 'products#index', as: 'places'
  # get 'project/new_release' => 'places#modal', :as => :modal

  # OAuth
  oauth_prefix = Rails.application.config.auth.omniauth.path_prefix
  get "#{oauth_prefix}/:provider/callback" => 'users/oauth#create'
  get "#{oauth_prefix}/failure" => 'users/oauth#failure'
  get "#{oauth_prefix}/:provider" => 'users/oauth#passthru', as: 'provider_auth'
  get oauth_prefix => redirect("#{oauth_prefix}/login")

  # Devise
  devise_prefix = Rails.application.config.auth.devise.path_prefix
  devise_for :users, path: devise_prefix,
    controllers: {registrations: 'users/registrations', sessions: 'users/sessions',
      passwords: 'users/passwords', confirmations: 'users/confirmations', unlocks: 'users/unlocks'},
    path_names: {sign_up: 'signup', sign_in: 'login', sign_out: 'logout'}
  devise_scope :user do
    get "#{devise_prefix}/after" => 'users/registrations#after_auth', as: 'user_root'
  end
  get devise_prefix => redirect('/a/signup')

  # User
  resources :users, path: 'u', only: :show do
    resources :authentications, path: 'accounts'
  end
  get '/home' => 'users#show', as: 'user_home'

  # Dummy preview pages for testing.
  get '/p/test' => 'pages#test', as: 'test'
  get '/p/email' => 'pages#email' if ENV['ALLOW_EMAIL_PREVIEW'].present?

  get 'robots.:format' => 'robots#index'

  root 'places#index'
  # get '/places/:id' => 'places#show'

  #root 'pages#home'

  #api
  namespace :api do
    namespace :v1 do
      resources :places, only: [:index, :create, :show, :update, :destroy]
      resources :ad_types, only: [:index, :create, :show, :update, :destroy]
      resources :categories, only: [:index, :create, :show, :update, :destroy]
      resources :affiliates, only: [:index, :create, :show, :update, :destroy]
      # places :places do
      #   get 'placeId', on: :member
      # end
    end
  end

end

