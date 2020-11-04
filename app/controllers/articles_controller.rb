class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /ARTICLES
  def index
    @articles = Article.all
  end

  # get /articles/1
  def show
  end

  # get /articles/new
  def new
    @article = Article.new
  end

  # get /articles/1/edit
  def edit
  end

  # post articles
  def create
    @article = Article.new(article_params)

    if @article.after_save
      redirect_to @article, notice: 'Article was sucessfully created'
    else
      render :new
    end
  end

  # patch/put / articles/1
  def update
    if @article.update(article_params)
      redirect_to @article, notice: 'Article was sucessfully destroyed.'
    else
      render :edit
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end


end
