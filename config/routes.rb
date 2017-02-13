Rails.application.routes.draw do

  root 'test#index'

  # Always version the API
  namespace :v1 do
    resources :consumer_complaints, path: 'consumer-complaints', only: [:index, :show], defaults: { format: :json }
    resources :consumer_complaint_companies, path: 'consumer-complaint-companies', only: [:index, :show], defaults: { format: :json }
    resources :consumer_complaint_products, path: 'consumer-complaint-products', only: [:index, :show], defaults: { format: :json }
    resources :consumer_complaint_subproducts, path: 'consumer-complaint-subproducts', only: [:index, :show], defaults: { format: :json }
    resources :consumer_complaint_issues, path: 'consumer-complaint-issues', only: [:index, :show], defaults: { format: :json }
  end

end
