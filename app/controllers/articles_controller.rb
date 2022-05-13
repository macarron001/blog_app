class ArticlesController < ApplicationController
  
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def show
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new
    @article.title = params[:article][:title]
    @article.body = params[:article][:body]

    if @article.save
      redirect_to articles_path
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update!(article_params)
      redirect_to "/articles/#{@article.id}"
    end
  end

  def destroy
    @article = Article.destroy(params[:id])
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end

end
