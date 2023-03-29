Rails.application.routes.draw do
  resources :event_steps
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  #root to: redirect('/frontend/Untitled-1.html')
  root 'welcome#index'
  #root to: "plan_models#index"
  #get "/login", :to => redirect('/frontend/Untitled-1.html')
  get "/articles", to: "articles#index"
  get "/articles_json", to: "articles#articles_json"
  #get "/edit_page", to: "plan_models#edit_page"
  
  resources :plan_models
  get "plan_models/:id/edit_admin", to: "plan_models#edit_admin", as: 'edit_admin'
  
  get "plan_models/:id/draw_panel", to: "plan_models#draw_panel"
  
  get "plan_models/:id/duplicate", to: "plan_models#duplicate"
  get "plan_models/:id/export", to: "plan_models#export"
  post "import", to: "plan_models#import"
  get "plan_models/:id/destroy", to: "plan_models#destroy"
  
  
  
  # plan_models -> return json
  get "/plan_models_json/:id", to: "plan_models#show_json"
  put "/plan_models_json/:id", to: "plan_models#update_json"
  post "/plan_models_json", to: "plan_models#create_json"
  
  get "edit_page", to: "plan_models#index"
  
  #get "/plan_models/:id", to: "plan_models#show"
  #post "/plan_models/update/:id", to: "plan_models#update"
  # Defines the root path route ("/")
  # root "articles#index"
  
  # user sign up and login
  get 'sign_up', to: 'registrations#new'
  post 'sign_up', to: 'registrations#create'
  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create', as: 'log_in'
  delete 'logout', to: 'sessions#destroy'
  get 'password', to: 'passwords#edit', as: 'edit_password'
  patch 'password', to: 'passwords#update'
  get 'password/reset', to: 'password_resets#new'
  post 'password/reset', to: 'password_resets#create'
  get 'password/reset/edit', to: 'password_resets#edit'
  patch 'password/reset/edit', to: 'password_resets#update'
  
  
  get "plan_models/:id/:name", to: redirect('/frontend/%{name}'), status: 302, name: /.*/
end
