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
end
     

