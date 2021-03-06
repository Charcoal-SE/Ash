Rails.application.routes.draw do
  devise_for :users
  root :to => 'dashboard#index'

  get    'websites',                                         :to => 'websites#index'
  get    'websites/new',                                     :to => 'websites#new'
  post   'websites/new',                                     :to => 'websites#create'
  get    'websites/json',                                    :to => 'websites#json_export'
  get    'websites/:id',                                     :to => 'websites#show'
  get    'websites/:id/edit',                                :to => 'websites#edit'
  patch  'websites/:id/edit',                                :to => 'websites#update'
  delete 'websites/:id',                                     :to => 'websites#destroy'

  get    'techs',                                            :to => 'techs#index'
  get    'techs/new',                                        :to => 'techs#new'
  post   'techs/new',                                        :to => 'techs#create'
  get    'techs/find',                                       :to => 'techs#find'
  get    'techs/:id',                                        :to => 'techs#show'
  get    'techs/:id/edit',                                   :to => 'techs#edit'
  patch  'techs/:id/edit',                                   :to => 'techs#update'
  delete 'techs/:id',                                        :to => 'techs#destroy'

  get    'admins',                                           :to => 'admins#index'
  get    'admins/new',                                       :to => 'admins#new'
  post   'admins/new',                                       :to => 'admins#create'
  get    'admins/find',                                      :to => 'admins#find'
  get    'admins/:id',                                       :to => 'admins#show'
  get    'admins/:id/edit',                                  :to => 'admins#edit'
  patch  'admins/:id/edit',                                  :to => 'admins#update'
  delete 'admins/:id',                                       :to => 'admins#destroy'

  get    'registrars',                                       :to => 'registrars#index'
  get    'registrars/new',                                   :to => 'registrars#new'
  post   'registrars/new',                                   :to => 'registrars#create'
  get    'registrars/find',                                  :to => 'registrars#find'
  get    'registrars/:id',                                   :to => 'registrars#show'
  get    'registrars/:id/edit',                              :to => 'registrars#edit'
  patch  'registrars/:id/edit',                              :to => 'registrars#update'
  delete 'registrars/:id',                                   :to => 'registrars#destroy'

  get    'keys',                                             :to => 'api_keys#index'
  get    'keys/new',                                         :to => 'api_keys#new'
  post   'keys/new',                                         :to => 'api_keys#create'
  get    'keys/:id/edit',                                    :to => 'api_keys#edit'
  patch  'keys/:id/edit',                                    :to => 'api_keys#update'
  delete 'keys/:id',                                         :to => 'api_keys#destroy'

  get    'api/websites',                                     :to => 'api#websites'
  get    'api/admins',                                       :to => 'api#admins'
  get    'api/techs',                                        :to => 'api#techs'
  get    'api/registrars',                                   :to => 'api#registrars'
  post   'api/websites',                                     :to => 'api#create_website'
  post   'api/admins',                                       :to => 'api#create_admin'
  post   'api/techs',                                        :to => 'api#create_tech'
  post   'api/registrars',                                   :to => 'api#create_registrar'

  get    'users/find',                                       :to => 'users#find'
end
