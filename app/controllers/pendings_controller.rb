class PendingsController < ApplicationController
  authorize_resource class: false
  before_action :set_pending, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @pendings = current_user.posts.pending
  end

  def destroy
    @pending.destroy
    respond_to do |format|
      format.html { redirect_to pendings_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
    
  private

  def set_pending
    @pending = Post.find(params[:id])
  end
end
