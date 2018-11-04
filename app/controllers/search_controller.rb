class SearchController < ApplicationController
  before_action :restrict_access

  def search
    if params[:q].nil?
      @zombies = []
    else
      @zombies = Zombie.search params[:q]
    end

    parse_results unless @zombies.empty?
    render json: @results
  end

  private

  def parse_results
    @results = ParseZombieSearchResultsService.new(@zombies).call
  end
end
