Rails.application.routes.draw do
  root :to => 'homes#top'
  # get '/' => 'homes#top'
  # root "books#index"
  resources :books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
