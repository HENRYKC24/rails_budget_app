class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    user_categories_path(current_user.id)
  end
end
