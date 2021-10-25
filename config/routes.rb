Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "graphql#execute"
  end

  post "/graphql", to: "graphql#execute"

  get '/sessions/new', as: 'login'

  get '/sessions/create', to: 'sessions#create'
end
