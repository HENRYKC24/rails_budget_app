class EntitiesController < ApplicationController
  def index
    @entities = Entity.all
    puts 'All entities => ', @entities
    @entity_groups = Group.find(params[:category_id]).entitygroups
    @entity_ids = @entity_groups.map { |group| group.entity_id }
    puts 'IDS', @entity_ids
    # puts 'Start', @entities, 'Middle', @entity_groups, 'End'

    @group_entities = @entities.select { |entity| @entity_ids.include? entity.id }

    puts 'Needed entities', @group_entities
  end

  def new
    @transaction = Entity.new
    @groups = (current_user.groups).map { |group| group.name}
  end

  def create
    puts 'groups=>', @groups
    puts params
  end
end
