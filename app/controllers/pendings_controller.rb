class PendingsController < ApplicationController
  before_action :set_pending, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
    def index
      @pendings = current_user.posts.pending
    end
    
    private

    def set_pending
      @pending = Post.find(params[:id])
    end
end
