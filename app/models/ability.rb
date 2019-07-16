class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.has_role? :user 
      can :create, Post

      can :read, :all

      can :destroy, Post.unverified, user_id: user.id 
      can :destroy, Post.published, user_id: user.id
      can :destroy, Post.verified, user_id: user.id
      can :destroy, Post.pending, user_id: user.id

      can :update, Post.unverified, user_id: user.id

      can :pend, Post.unverified, user_id: user.id 
      can :back_to_unverified, Post.archieved, user_id: user.id
    end


  end
end
