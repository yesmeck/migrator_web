MigratorWeb::Engine.routes.draw do
  root 'migrations#index'

  resources :migrations do
    member do
      post :down
      post :up
      post :redo
    end
  end
end
