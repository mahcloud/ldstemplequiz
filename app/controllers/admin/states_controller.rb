class Admin::StatesController < AdminApplicationController
  def new
    country = Country.find(params[:country_id])
    @state = country.states.new
  end

  def create
    @state = State.new(params[:state].permit([:name, :country_id]))
    if @state.save
      redirect_to new_admin_temple_path({:state_id => @state.id, :country_id => @state.country.id, :continent_id => @state.country.continent.id})
    else
      render 'new'
    end
  end
end
