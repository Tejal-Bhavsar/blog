Rails.application.routes.draw do
  get "welcome/index"
  resources :articles do
    resources :comments
  end
  resources :comments
  devise_scope :user do
    # using login path for registration
    post "users/sign_up" => "users#create", :as => :user_registration
  end
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "welcome#index"
end
