class EntitiesController < ApplicationController
  def index
    @entities = Entity.all
    @entity_groups = Group.find(params[:category_id]).entitygroups
    @entity_ids = @entity_groups.map(&:entity_id)
    @group_entities = @entities.select { |entity| @entity_ids.include? entity.id }
    @total = 0
    @group_entities.each { |each| @total += each.amount }
  end

  def new
    @transaction = Entity.new
    @current_user = current_user
  end

  def create
    @entity = Entity.new(name: params[:name], amount: params[:amount].to_i, user_id: current_user.id)
    if @entity.save
      @group = current_user.groups.select { |group| group.name == params[:group] }
      Entitygroup.create(entity_id: @entity.id, group_id: @group[0].id)
    end

    render :new
  end
end
