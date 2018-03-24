Rails.application.routes.draw do


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
    resources :campaigns
  end


  resources :members
  get 'home/index'

   root :to => "home#index"


  # *MUST* come *BEFORE* devise's definitions (below)
  as :user do
    match 'user/confirmation' => 'confirmations#update', :via => :put, :as => :update_user_confirmation
  end

  devise_for :users, :controllers => {
    :registrations => "milia/registrations",
    :confirmations => "confirmations",
    :sessions => "milia/sessions",
    :passwords => "milia/passwords",
  }


  resources :users
end
