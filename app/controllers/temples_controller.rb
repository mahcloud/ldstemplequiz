class TemplesController < ApplicationController
  def index
    begin
      @country = Country.find params[:country_id]
    rescue ActiveRecord::RecordNotFound
      @country = Country.all.order('name ASC').first
    end
  end
end
