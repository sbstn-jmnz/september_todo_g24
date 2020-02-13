Rails.application.routes.draw do
  get 'todos', to: 'todos#index'
  get 'tasks/index'
  patch 'todos/:id', to: 'todos#update', as: 'update_todo'
  get 'todos/:id', to: 'todos#show', as: 'show_todo'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "tasks#index"
end
