Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get "/merchants/find", to: "merchants#find"
      get "/customers/find", to: "customers#find"
      get "/invoice_items/find", to: "invoice_items#find"
      get "/invoices/find", to: "invoices#find"
      get "/items/find", to: "items#find"
      get "/transactions/find", to: "transactions#find"

      get "/merchants/find_all", to: "merchants#find_all"
      get "/customers/find_all", to: "customers#find_all"
      get "/invoice_items/find_all", to: "invoice_items#find_all"
      get "/invoices/find_all", to: "invoices#find_all"
      get "/items/find_all", to: "items#find_all"
      get "/transactions/find_all", to: "transactions#find_all"

      get "/merchants/random", to: "merchants#random"
      get "/customers/random", to: "customers#random"
      get "/invoice_items/random", to: "invoice_items#random"
      get "/invoices/random", to: "invoices#random"
      get "/items/random", to: "items#random"
      get "/transactions/random", to: "transactions#random"

      get "/merchants/:id/items", to: "merchants/items#index"
      get "/merchants/:id/invoices", to: "merchants/invoices#index"

      get "/invoices/:id/transactions", to: "invoices/transactions#index"
      get "/invoices/:id/invoice_items", to: "invoices/invoice_items#index"
      get "/invoices/:id/items", to: "invoices/items#index"
      get "/invoices/:id/customer", to: "invoices/customers#show"
      get "/invoices/:id/merchant", to: "invoices/merchants#show"

      get "/invoice_items/:id/invoice", to: "invoice_items/invoices#show"
      get "/invoice_items/:id/item", to: "invoice_items/items#show"

      get "/items/:id/invoice_items", to: "items/invoice_items#index"
      get "/items/:id/merchant", to: "items/merchants#index"

      get "/transactions/:id/invoice", to: "transactions/invoices#show"

      get "/customers/:id/invoices", to: "customers/invoices#index"
      get "/customers/:id/transactions", to: "customers/transactions#index"

      resources :merchants, only: [:show, :index]
      resources :customers, only: [:show, :index]
      resources :invoices, only: [:show, :index]
      resources :invoice_items, only: [:show, :index]
      resources :items, only: [:show, :index]
      resources :transactions, only: [:show, :index]
      # namespace :merchants do
      #   get '/find', to: "merchant#find"
      # end
    end
  end
end
