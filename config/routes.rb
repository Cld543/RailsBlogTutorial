Rails.application.routes.draw do
  root "articles#index" 

  # for GET requests to the /articles endpoint, route to the "index"
  # action of the articles controller. This action sets the instance
  # variable of the articles controller to "articles.all", which fetches
  # all of the articles from the database. The articles are stored in the
  # instance variable @articles, which is accessible from the "index" view.
  # The index view then outputs all articles titles to the screen in HTML
  
  # get "/articles", to: "articles#index"
  # get "/articles/:id", to: "articles#show"

  resources :articles do
    resources :comments
  end
end
