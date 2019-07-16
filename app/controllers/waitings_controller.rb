class WaitingsController < ApplicationController
  authorize_resource class: false
  before_action :authenticate_user!
  before_action :set_waiting, only: [:show, :edit, :update, :reject, :verify]

  def index 
    @waitings = Post.pending
  end


  def reject 
    @waiting.reject!
  end
    
  def verify
    @waiting.verify!
    redirect_to waitings_url
  end
    

  private

  def set_waiting
    @waiting = Post.find(params[:id])
  end
    

    

end