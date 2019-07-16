RailsAdmin.config do |config|
  config.authorize_with do
    redirect_to main_app.root_path unless warden.user.has_role? :admin
   end
  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    config.actions do
      allowable_models = ['User', 'Role']
  
      dashboard do
        only allowable_models
      end
  
      index do
        only allowable_models
      end
  
      show do
        only allowable_models
      end
  
      new do
        only allowable_models
      end
  
      edit do
        only allowable_models
      end
  
      delete do
        only allowable_models
      end
  
      ## With an audit adapter, you can add:
      # history_index
      # history_show
    end
end
end
