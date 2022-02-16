class CategoriesController < ApplicationController
  def index
    @categories = current_user.groups
  end

  def show; end

  def create; end
end
