class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :pend]
  before_action :authenticate_user!
  load_and_authorize_resource
  
  

  def index
    @posts = current_user.posts.unverified
  end

  def show
  end

  
  def new
    @post = current_user.posts.build
  end

  
  def edit
  end

  def create
    @post = current_user.posts.build(post_params)

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

  def remove_attachment
    @img = ActiveStorage::Attachment.find(params[:id])
    @post = @img.record
    @img.purge
    redirect_to @post
  end

  def pend
    @post.pend!
    redirect_to posts_url
  end

  private
    
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :description, images: [])
    end
end
