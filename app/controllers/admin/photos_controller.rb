class Admin::PhotosController < AdminApplicationController
  def new
    @temple = Temple.find(params[:temple_id])
    @photos = @temple.photos
    @photo = @temple.photos.new
  end

  def create
    @temple = Temple.find(params[:temple_id])
    @photos = @temple.photos
    @photo = @temple.photos.new
    @photo.update_attributes(params[:photo].permit([:temple_id, :link]))
    if @photo.save
      redirect_to admin_home_path
    else
      render 'new'
    end
  end
end
