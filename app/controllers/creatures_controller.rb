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
    # if creature saves, redirect a route that shows all creatures
    if creature.save
      redirect_to creatures_path
      # redirect_to creature_path is equivalent to redirect_to "/creatures"
    end
  end
end
     

