Rails.application.routes.draw do

  get  'main' => 'users#index'

  post 'users/register' => 'users#register'

  post 'users/login' => 'users#login'

  get 'professional_profile' => 'profiles#index'

  delete 'users/logout' => 'users#logout'

  get 'users' => 'profiles#users'

  get 'users/:id' => 'users#show'

  post 'invitations/:id/create' => 'invitations#create'

  delete 'invitations/:id/destroy' => 'invitations#destroy'

  post "/networks/:user_id/create/:invitation_id" => "networks#create"
end
