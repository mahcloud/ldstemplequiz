class HomeController < ApplicationController
  def index
    @continents = Continent.all.order('name ASC')
  end
end