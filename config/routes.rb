Rails.application.routes.draw do

  constraints format: :json do

    # Always version the API
    namespace :v1 do
      resources :consumer_complaints, path: 'consumer-complaints', only: [:index]
      resources :consumer_complaint_companies, path: 'consumer-complaint-companies', only: [:index, :show]
      resources :consumer_complaint_zip_codes, path: 'consumer-complaint-zip-codes', only: [:index, :show], defaults: { format: :json }

      resources :consumer_complaint_products, path: 'consumer-complaint-products', only: [:index, :show], defaults: { format: :json }
      resources :consumer_complaint_subproducts, path: 'consumer-complaint-subproducts', only: [:index, :show], defaults: { format: :json }
      resources :consumer_complaint_issues, path: 'consumer-complaint-issues', only: [:index, :show], defaults: { format: :json }
      resources :consumer_complaint_subissues, path: 'consumer-complaint-subissues', only: [:index, :show], defaults: { format: :json }
    end

  end
end
