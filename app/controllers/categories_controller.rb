class CategoriesController < ApplicationController
  def index
    @categories = current_user.groups

    # @entities = Entity.all
    # @entity_ids = @entity_groups.map(&:entity_id)
    # @group_entities = @entities.select { |entity| @entity_ids.include? entity.id }
    # @total = 0
    # @group_entities.each { |each| @total += each.amount }
  end

  def show; end

  def new
    @category = Group.new
    @groups = current_user.groups
  end

  def create
    uploaded_file = params[:group][:icon]

    @cat = nil
    if uploaded_file.content_type[0, 5] == 'image'
      uploaded_file.original_filename = (Time.now.to_f * 1000).to_i.to_s + uploaded_file.original_filename
      File.binwrite(Rails.root.join('app/assets', 'images', uploaded_file.original_filename), uploaded_file.read)
      @cat = Group.new(name: params[:group][:name], icon: uploaded_file.original_filename)
      @cat.user_id = current_user.id
    end

    if @cat
      if @cat.save
        redirect_to user_categories_path, notice: 'Category added successfully'
      else
        re_render :new, alert: 'Oops! Category addition failed'
      end
    else
      redirect_to user_categories_path, alert: 'Oops! Wrong file type'
    end
  end

  private

  def category_param
    # params.required(:group).permit(:name, :icon)
  end
end
