Rails.application.routes.draw do
root "creatures#index"

get "/creatures", to: "creatures#index", as: "creatures"
get "/creatures/new", to: "creatures#new", as: "new_creatures"
post "/creatures", to: "creatures#create"
get "/creature/:id", to: "creature#show", as: "creature"
end