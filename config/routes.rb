Rails.application.routes.draw do


  resources :user_campaigns
  resources :source_linksets
  resources :sources
  resources :destination_linksets
  resources :destinations
  resources :linksets do
    get 'destinations', on: :member
    put 'add_destination', on: :member
    get 'sources', on: :member
    put 'add_source', on: :member
  end

  resources :tenants do
    resources :campaigns do
      get 'users', on: :member
      put 'add_user', on: :member
    end
  end

  resources :members
  get 'home/index'

  root :to => "home#index"


  # *MUST* come *BEFORE* devise's definitions (below)
  as :user do
    match 'user/confirmation' => 'confirmations#update', :via => :put, :as => :update_user_confirmation
  end

  devise_for :users, :controllers => {
    :registrations => "registrations",
    :confirmations => "confirmations",
    :sessions => "milia/sessions",
    :passwords => "milia/passwords",
  }

  match '/plan/edit' => 'tenants#edit', via: :get, as: :edit_plan
  match '/plan/update' => 'tenants#update', via: [:put, :patch], as: :update_plan

end
