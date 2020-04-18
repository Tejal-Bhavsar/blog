class ArticlesController < ApplicationController
  before_action :authenticate_user!, :set_last_seen_at, if: proc { user_signed_in? }
  
  def index
    @articles = Article.all
    @comments = Comment.all
    @users    = User.all
    respond_to do |format|
      format.html
      format.csv { send_data @users.to_csv }
      format.xls { send_data @users.to_csv(col_sep: "\t") }
    end
  end
      
  def show
    @article = Article.find(params[:id])
    @comments = @article.comments
  end
      
      
  def new
    @article = Article.new
  end
  def edit
    @article = Article.find(params[:id])
  end
  
  def create
    @article = Article.new(article_params)
  
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])
  
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
  
    redirect_to articles_path
  end     
  private
  def article_params
    params.require(:article).permit(:title, :text,:user_id)
  end
  
  private
  def set_last_seen_at
    current_user.update_attribute(:last_seen_at, Time.now )
  end
   
end