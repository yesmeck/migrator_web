Rails.application.routes.draw do

  mount MigratorWeb::Engine => "/migrator_web"
end
