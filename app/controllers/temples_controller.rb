class TemplesController < ApplicationController
  def index
    begin
      continent = Continent.find params[:continent_id]
      @temples = continent.temples.order('name ASC')
    rescue ActiveRecord::RecordNotFound
      @temples = Temple.all.order('name ASC')
    end
  end
end
