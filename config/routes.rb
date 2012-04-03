HstoreBlog::Application.routes.draw do
  resources :entries

  root :to => 'application#index'
end
