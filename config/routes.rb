Rails.application.routes.draw do
  resources :posts do
    member do
      delete :remove_attachment
    end
  end
  devise_for :users
  root to: 'posts#index'
end
