Rails.application.routes.draw do
  get 'bookbuilder/show'
  get 'bookbuilder/play'
  get 'bookbuilder/build_parts'
  get 'bookbuilder/build_layouts'
  get 'bookbuilder/build_books'
  get 'bookbuilder/build_contracts'
  devise_for :users
  get 'pdf_page/index'
  get 'pdf_page/show'
  get 'pdf_page/create'
  get 'guide/index'
  get 'guide/start'
  get 'guide/map'
  # get 'guide/login'

  resources :record_lists
  resources :records
  resources :page_parts
  resources :page_layouts
  resources :contracts
  resources :books


  # get 'guide/index'
  # get 'guide/map'
  # get 'guide/start'
  get 'guide/login'
  # resources :records
  # get 'pdf_pages/index'
  # get "reset" => "page_parts#reset"

  get "show_edit" => "contracts#show_edit"
  post "show_edit" => "contracts#show_edit"

  get 'pdf_pages/show'
  get 'pdf_pages/create'


  
 root 'guide#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
