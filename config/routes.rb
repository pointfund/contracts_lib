Rails.application.routes.draw do
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
  
 root 'guide#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
