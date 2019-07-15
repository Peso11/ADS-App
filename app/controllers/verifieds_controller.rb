class VerifiedsController < ApplicationController
  before_action :set_verified, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  def index
    @verifieds = current_user.posts.verified
  end

  def destroy
    @verified.destroy
    respond_to do |format|
      format.html { redirect_to verifieds_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  private

  def set_verified
    @verified = Post.find(params[:id])
  end
end
