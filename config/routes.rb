Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/tasks/:id/unfinished_change" => "tasks#unfinished_change"
  get "/tasks/:id/finished_change" => "tasks#finished_change"
  post "/tasks/:id/update" => "tasks#update"
  get "/tasks/:id/edit" => "tasks#edit"
  post "/tasks/create" => "tasks#create"
  get "/tasks/:id/destroy" => "tasks#destroy"


  post "/visions/:id/update" => "visions#update"
  get "/visions/:id/edit" => "visions#edit"
  get "/visions" => "visions#index"
  get "/visions/new" => "visions#new"
  post "/visions/create" => "visions#create"

  # Devise routes メール送信完了画面を表示するにはここが重要
  devise_for :users, controllers: { registrations: "registrations" }

  root 'pages#index'
  get 'pages/show'
  get 'pages/precomplete'

  
end
