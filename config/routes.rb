Rails.application.routes.draw do
  get "topics/new"
  get "topics/create"
  get "charts/index"
  get "progress/index"
  get "calendar/index"
  get "timer/index"
  get "dashboard/index"
  
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  

  get "home/index"
  root "sessions#new"
  get "/register", to: "users#new"
  post "/register", to: "users#create"
  

  resources :subjects

  resources :tasks
  patch "/tasks/:id/toggle",
      to: "tasks#toggle",
      as: :toggle_task

  get "/timer", to: "timer#index"
  get "/calendar", to: "calendar#index"
  get "/progress", to: "progress#index"
  get "/charts", to: "charts#index"
  

  get "/subjects/:subject_id/topics/new",
    to: "topics#new",
    as: :new_subject_topic

  post "/subjects/:subject_id/topics",
    to: "topics#create",
    as: :subject_topics

  delete "/subjects/:id",
       to: "subjects#destroy",
       as: :delete_subject

  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
