class QuizController < ApplicationController
  def index
    @temple = Temple.order("RANDOM()").first
    @continents = Continent.all.order('name ASC')
  end
end