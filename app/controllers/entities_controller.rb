class EntitiesController < ApplicationController
  def index
    @entities = Entity.all
    puts 'All entities => ', @entities
    @entity_groups = Group.find(params[:category_id]).entitygroups
    @entity_ids = @entity_groups.map(&:entity_id)
    puts 'IDS', @entity_ids
    # puts 'Start', @entities, 'Middle', @entity_groups, 'End'

    @group_entities = @entities.select { |entity| @entity_ids.include? entity.id }

    puts 'Needed entities', @group_entities
  end

  def new
    @transaction = Entity.new
    # @groups = current_user.groups.map { |group| group.name}
    @current_user = current_user
  end

  def create
    @entity = Entity.new(name: params[:name], amount: params[:amount].to_i, user_id: current_user.id)
    if @entity.save
      @group = current_user.groups.select { |group| group.name == params[:group]}
      Entitygroup.create(entity_id: @entity.id, group_id: @group[0].id)
    else
      puts 'not ok'
    end
    
    render :new
  end
end
