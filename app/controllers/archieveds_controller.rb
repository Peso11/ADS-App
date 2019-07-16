class ArchievedsController < ApplicationController
  authorize_resource class: false
  before_action :set_archieved, only: [:show, :edit, :update, :destroy, :back_to_unverified]
  before_action :authenticate_user!
  
  def index
    @archieveds = current_user.posts.archieved
  end

  def back_to_unverified
    @archieved.back_to_unverified!
    redirect_to posts_url
  end
    
  
      
  private
  
  def set_archieved
    @archieved = Post.find(params[:id])
  end
end