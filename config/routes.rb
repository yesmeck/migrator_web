MigratorWeb::Engine.routes.draw do
  root 'migrations#index'

  resources :migrations do
    collection do
      post :migrate
    end

    member do
      post :down
      post :up
      post :redo
    end
  end
end
