Rails.application.routes.draw do
  get 'reports', to: 'reports#index'
  get 'reports/report-by-category', to: 'reports#report_by_category'
  get 'reports/report-by-dates', to: 'reports#report_by_dates'
  resources :operations
  resources :categories
  get 'about', to: 'pages#about'
  get 'framework', to: 'pages#framework'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'pages#index'
end
