class ZombiesController < ApplicationController
  def index
    @zombies = Zombie.all
    render json: @zombies
  end

  def show
    @zombie = Zombie.find(params[:id])
    render json: @zombie
  end
end
