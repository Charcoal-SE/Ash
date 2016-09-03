Rails.application.routes.draw do
  devise_for :users
  root :to => 'dashboard#index'

  get    'websites',                                         :to => 'websites#index'
  get    'websites/new',                                     :to => 'websites#new'
  post   'websites/new',                                     :to => 'websites#create'
  get    'websites/:id',                                     :to => 'websites#show'
  get    'websites/:id/edit',                                :to => 'websites#edit'
  patch  'websites/:id/edit',                                :to => 'websites#update'
  delete 'websites/:id',                                     :to => 'websites#destroy'
end
