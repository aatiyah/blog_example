class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :post_owner, only: [:edit, :update, :destroy]

  def post_owner
    unless @post.blog.user == current_user
      flash[:alert] = 'Access denied, you are not the owner of this Post.'
      redirect_to @post
     end
  end

  def index
    @posts = Post.all.paginate(page: params[:page], per_page: 5)
  end

  def show
  	@user = @post.blog.user
  end

  def new
    @post = Post.new
    @blogs = Blog.all
  end

  def edit
  	@blogs = Blog.all
  end

  def create
  	@post = Post.new(post_params)
  	@blogs = Blog.all
  	@post.blog.user = current_user

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :content, :blog_id, :user_id)
    end
end
