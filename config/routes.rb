Rails.application.routes.draw do

  root to: 'questions#index'

  resources :tests do
    resources :questions, shallow: true
  end

end
