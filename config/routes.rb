Rails.application.routes.draw do
  root "main#index"
  
  get "/articles", to: "articles#index"

  post "/clicked", to: "articles#index"

  post "/quizbox", to: "quizbox#index"

  post "/answers", to: "answers#index"

  post "/form", to: "form#index"

  post "/valanswers", to: "valanswers#index"

end
