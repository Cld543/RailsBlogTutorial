class ArticlesController < ApplicationController
  def index
    # Fetch all Articles from the database
    @articles = Article.all
  end

  # The :id route parameter (from config/routes.rb) is sent to the controller in the "params"
  # object
  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update 
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end


  # FIXED BUG - NOT DELETING
  # Had to run bin/rails importmap:install
  # and
  # bin/rails turbo:install
  # in order to get the delete action to work
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end
  
  private 
    def article_params
      params.expect(article: [:title, :body])
    end
  end

