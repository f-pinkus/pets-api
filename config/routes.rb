Rails.application.routes.draw do
  get "/pets", controller: "pets", action: "index"
  get "/pets/:id", controller: "pets", action: "show"
  post "/pets", controller: "pets", action: "create"
  patch "/pets/:id", controller: "pets", action: "update"
  put "/pets/:id", controller: "pets", action: "update"
  delete "/pets/:id", controller: "pets", action: "destroy"

  post "/signup", controller: "users", action: "create"

  post "/login", controller: "sessions", action: "create"
  delete "/logout", controller: "sessions", action: "destroy"
end
