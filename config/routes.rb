Rails.application.routes.draw do

  root 'pages#landing'
  resources :books

end
