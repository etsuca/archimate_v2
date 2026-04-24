Rails.application.routes.draw do
  authenticated :user do
    root "static_pages#top", as: :authenticated_root
  end

  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  devise_scope :user do
    get "registrations/edit_password", to: "users/registrations#edit_password"
    put "registrations/update_password", to: "users/registrations#update_password"
  end

  get "top", to: "static_pages#top"
  get "welcome", to: "static_pages#welcome"
  get "terms", to: "static_pages#terms"
  get "privacy_policy", to: "static_pages#privacy_policy"
  get "up" => "rails/health#show", as: :rails_health_check

  root "static_pages#welcome"
end
