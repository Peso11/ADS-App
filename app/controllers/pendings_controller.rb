class PendingController < ApplicationController
    def index
      @pendings = current_user.posts.pending
    end
end
