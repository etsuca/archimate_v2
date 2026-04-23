Rails.application.routes.draw do
  get "top", to: "static_pages#top"
  get "welcome", to: "static_pages#welcome"
  get "terms", to: "static_pages#terms"
  get "privacy_policy", to: "static_pages#privacy_policy"
  get "up" => "rails/health#show", as: :rails_health_check

  root "static_pages#welcome"
end
