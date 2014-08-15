class TemplesController < ApplicationController
  def index
    begin
      @continent = Continent.find params[:continent_id]
    rescue ActiveRecord::RecordNotFound
      @continent = Continent.all.order('name ASC').first
    end
  end
end
