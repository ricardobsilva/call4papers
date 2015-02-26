Rails.application.routes.draw do
  root 'home#index'

  devise_for :users

  get "events", to: "events#index", as: :events
  get "contact", to: "home#contact", as: :contact

end
