Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

   root to: "home#index"

   resources :user do
    resources :category do
    resources :transaction
    end
   end
  
  
end
