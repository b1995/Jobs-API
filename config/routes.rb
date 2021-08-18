Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  resources :job_posts do
    resources :job_applications, :only  => [:create]
  end
  resources :job_applications, :only => [:index, :destroy, :show]
end
