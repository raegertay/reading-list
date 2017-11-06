Rails.application.routes.draw do

  root 'pages#landing'
  resources :books do
    resources :bookmarks, shallow: true
  end

end
