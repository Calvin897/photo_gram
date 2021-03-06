Rails.application.routes.draw do
  get 'relationships/follow_user'
  get 'relationships/unfollow_user'
  get 'notices/link_through'
  get 'profiles/show'
  devise_for :users, :controllers => { :registrations => "registrations" }
  #allows for nested comments
  resources :posts do
    resources :comments
    resource :like, module: :posts
end

  resources :users

 

  get :index, to: 'welcome#index', as: :index


  get :seen, to: 'notices#seen', as: :seen

  # get :follow_count, to: 'profiles#follow_count', as: :follow_count

  get :coolio_man, to: 'notices#coolio_man', as: :coolio_man

  get 'notices/:id/link_through', to: 'notices#link_through',
  as: :link_through

  post ':user_name/follow_user', to: 'relationships#follow_user', as: :follow_user
  post ':user_name/unfollow_user', to: 'relationships#unfollow_user', as: :unfollow_user

  get 'search', to: 'posts#search', as: 'item_search'

  get ':user_name', to: 'profiles#show', as: :profile

  get ':user_name/edit', to: 'profiles#edit', as: :edit_profile

  patch ':user_name/edit', to: 'profiles#update', as: :update_profile

  root "posts#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
