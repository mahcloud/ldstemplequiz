class PhotosController < ApplicationController
  def index
    begin
      @temple = Temple.find params[:temple_id]
    rescue ActiveRecord::RecordNotFound
      @temple = Temple.all.order('name ASC').first
    end
  end
end
