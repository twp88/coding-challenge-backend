class SearchController < ApplicationController
  def search
    if params[:q].nil?
      @zombies = []
    else
      @zombies = Zombie.search params[:q]
    end

    @results = ParseZombieSearchResultsService.new(@zombies).call unless @zombies.empty?
    render json: @results
  end
end
