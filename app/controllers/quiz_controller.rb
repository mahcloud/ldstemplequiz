class QuizController < ApplicationController
  def index
    @temple = Temple.order("RANDOM()").first
    session[:quiz_temple_id] = @temple.id
    @continents = Continent.all.order('name ASC')
  end
end