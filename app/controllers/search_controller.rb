class SearchController < ApplicationController
  def search
    if params[:q].nil?
      @zombies = []
    else
      @zombies = Zombie.search params[:q]
    end

    render json: @zombies
  end
end
