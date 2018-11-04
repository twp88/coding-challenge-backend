class SearchController < ApplicationController
  before_action :restrict_access

  def search
    if params[:q].nil?
      @results = []
    else
      @results = []
      @zombies = ParseZombieSearchResultsService.new(Zombie.search params[:q])
                                                .call

      @weapons = Weapon.search params[:q]
      @armors = Armor.search params[:q]

      @results << @zombies << @armors << @weapons
    end

    render json: @results
  end
end
