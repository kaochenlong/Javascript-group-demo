Demo::Application.routes.draw do
  resources :reasons
  root :to => 'welcome#index'
end
