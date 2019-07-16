Rails.application.routes.draw do
  resources :posts do
    member do
      delete :remove_attachment
      put :pend
    end
  end
  devise_for :users
  root to: 'posts#index'
  resources :pendings 
  resources :verifieds
  resources :archieveds do
    member do
      put :back_to_unverified
    end
  end
end
