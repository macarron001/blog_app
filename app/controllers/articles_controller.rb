class ArticlesController < ApplicationController
  
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
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

  end

  def update
    @article = Article.find(params[:id])
    if @article.update!(article_params)
      redirect_to "/articles"
    end
  end

  def delete

  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end

end
