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
end
