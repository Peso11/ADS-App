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
end
