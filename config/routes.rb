Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  resources :job_posts
  resources :job_applications
end
