Rails.application.routes.draw do

  resources :races do
    get 'import', to: 'races#import'
    collection { post :import}
  end

  root to: "races#index"
end