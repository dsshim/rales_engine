Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get "/merchants/find", to: "merchants#find"
      get "/customers/find", to: "customers#find"
      get "/invoice_items/find", to: "invoice_items#find"
      get "/invoices/find", to: "invoices#find"
      get "/items/find", to: "items#find"
      get "/transactions/find", to: "transactions#find"
      resources :merchants, only: [:show]
      resources :customers, only: [:show]
      resources :invoices, only: [:show]
      resources :invoice_items, only: [:show]
      resources :items, only: [:show]
      resources :transactions, only: [:show]
      # namespace :merchants do
      #   get '/find', to: "merchant#find"
      # end
    end
  end
end
