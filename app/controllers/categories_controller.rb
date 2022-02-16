class CategoriesController < ApplicationController
  def index
    @categories = current_user.groups
    puts params, '<<<<<>>>>>'
  end
  def show; end

  def create
    puts params, '***********'
    group = current_user.groups.create(name: params[:name], icon: params[:name])
    if group.save
      redirect_to user_categories_path, notice: 'Category added successfully'
    else
      redirect_to user_categories_path, alert: 'Oops! Category addition failed'
    end
  end
end
