class SearchController < ApplicationController
  def search
    if params[:q].nil?
      @zombies = []
    else
      @zombies = Zombie.search params[:q]
    end

    ParseZombieSearchResultsService.call(@zombies) unless @zombies.empty?
    render json: @zombies
  end
end
