class CommentsController < ApplicationController
  before_action :get_article

  # GET /comments or /comments.json
  def index
    @comments = @article.comments
  end

  # GET /comments/1 or /comments/1.json
  def show
    @comment = @article.comments.find(params[:id])
  end

  # GET /comments/new
  def new
    @comment = @article.comments.build
  end

  # GET /comments/1/edit
  def edit
    @comment = @article.comments.find(params[:id])
  end

  # POST /comments or /comments.json
  def create
    @comment = @article.comments.build(comment_params)
    if @comment.save
      redirect_to article_comments_path
    else
      render :new
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    @comment = @article.comments.find(params[:id])
    if @comment.update!(comment_params)
      redirect_to article_comments_path(@article)
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @comment = @article.comments.find(params[:id])
  

    if @comment.destroy!
      redirect_to article_comments_path(@article)
    end
  end

  private

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:body, :article_id)
    end

    def get_article
      @article = Article.find(params[:article_id])
    end
end
