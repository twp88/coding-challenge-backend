class ZombiesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound do
    logger.error "Woops! This zombie doesn't exist!"
    render file: "#{Rails.root}/public/404.html", status: 404
  end

  def index
    @zombies = Zombie.all
    render json: @zombies
  end

  def show
    @zombie = Zombie.find(params[:id])
    render json: @zombie
  end

  def new
    @zombie = Zombie.new
  end

  def create
    @zombie = Zombie.create(zombie_params)
  end

  def update
    @zombie = Zombie.find(params[:id])
    @zombie.update_attributes(zombie_params)
  end

  def destroy
    Zombie.find(params[:id]).destroy
  end

  private

  def zombie_params
    params.permit(:id,
                  :name,
                  :brains_eaten,
                  :speed,
                  :hit_points,
                  :turn_date,
                  :weapons,
                  :armors,
                  :created_at,
                  :updated_at)
  end
end
