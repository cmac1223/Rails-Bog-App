class CreaturesController < ApplicationController

  def index
  @creatures = Creature.all
  end

  # show the new creature form
  def new
    @creature = Creature.new
    # remember the default behavior is to render :new
  end

  def create 
    # white list params
    creature_params = params.require(:creature).permit(:name, :description)

    # create a new creature in the database from the params
    creature = Creature.new(creature_params)

    # if creature saves, redirect to route that displays
    # ONLY the newly created creature
    if creature.save
      redirect_to creatures_path(creature)
      # redirect_to creature_path(creature) is equivalent to:
      # redirect_to creature "/creatures/#{creature.id} "
    end
  end

  def show
    # get the creature id from the url params
    creature_id = params[:id]

    # use `creature_id` to find the creature in the database
    # and save it to an instance variable
    @creature = Creature.find_by_id(creature_id)

    # render the show view (it has access to instance variable)
    # remember the default behavior is to render :show
    
  end

  # show the edit creature form
  def edit
    # get the creature id from the url params
    creature_id = params[:id]

    # use `creature_id` to find creature in the database
    # and save it to the instance variable
    @creature = Creature.find_by_id(creature_id)
    # render the edit view (it has access to instance variable)
  end

  # update creature in the database
  def update
    # get the creature id from the url params
    creature_id = params[:id]

    # use the `creature_id` to find the creature in the database 
    creature = Creature.find_by_id(creature_id)

    # whitelist params and save to variable
    creature_params = params.require(:creature).permit(:name, :description)

    # update the creature based on params
    creature.update_attributes(creature_params)

    # redirect the show page for the updated creature
    redirect_to creature_path(creature)
    # redirect_to creature_path(creature) is equivalent to:
    # redirect_to "/creatures/#{creature.id}"
    
  end
  # delete a creature from a database
  def destroy
    # get the creature id from the url params
    creature_id = params[:id]

    # use `creature_id` to find the creature from the database and save it
    creature = Creature.find_by_id(creature_id)

    # destroy the creature
    creature.destroy

    # redirect to creature index
    redirect_to creatures_path
    # redirect_to creature_path is equivalent to:
    # redirect_to "/creatures"
  end

  private

  def creature_params
    # whitelist params return whitelist version
    params.require(:creature).permit(:name, :description)
  end
end
     

