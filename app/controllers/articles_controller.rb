class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :admin_user, only: [:new, :edit, :create, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)
    @article.username = current_user.username
    upload_image!
    if @article.save
      redirect_to @article, notice: 'Article was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    @article.username = current_user.username
    upload_image!
    if @article.update(article_params)
      redirect_to @article, notice: 'Article was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    redirect_to articles_url
  end

  def welcome
    @article = Article.find_by(slug: 'announcements')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find_by(slug: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :category, :body)
    end
    
    # Upload images to amazon s3
    def upload_image!
      uploaded_io = params[:article][:picture]
      if uploaded_io
        file = "article_#{@article.slug}.jpg"
        AWS::S3::S3Object.store(file, uploaded_io.read, ENV["AWS_BUCKET"], :access => :public_read)
        @article.picture = "https://s3.amazonaws.com/#{ENV["AWS_BUCKET"]}/#{file}"
      end
    end
    
end
