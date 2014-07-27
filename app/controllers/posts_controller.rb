class PostsController < ApplicationController
  
  before_action :set_clutch
  before_action :set_post, only: [:edit, :update, :destroy]
  before_action :signed_in_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :correct_user, only: [:new, :create, :edit, :update, :destroy]
  

  # GET /posts
  # GET /posts.json
  def index
    @posts = @clutch.posts
  end

  # GET /posts/new
  def new
    @post = @clutch.posts.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = @clutch.posts.new(post_params)

    if @post.save
      redirect_to clutch_posts_path(@clutch), notice: 'Hatching post was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    if @post.update(post_params)
      redirect_to redirect_to clutch_posts_path(@clutch), notice: 'Hatching post was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    redirect_to clutch_posts_path(@clutch)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :post_body)
    end
end
