class Admin::TemplesController < AdminApplicationController
  def index
    @temples = Temple.all.order('name ASC')
  end

  def new
    @temple = Temple.new
    @continents = continent_options
    begin
      @continent = Continent.find(params[:continent_id])
      @countries = country_options(@continent)
      @country = Country.find_by_id_and_continent_id(params[:country_id], @continent.id)
      @states = state_options(@country)
      @state = State.find_by_id_and_country_id(params[:state_id], @country.id)
    rescue
    end
  end

  def show
    @temple = Temple.find(params[:id])
  end

  def create
    @temple = Temple.new
    path_params = {}
    begin
      @continent = Continent.find(params[:continent_id])
      path_params[:continent_id] = @continent.id unless @continent.nil?
      @country = Country.find_by_id_and_continent_id(params[:country_id], @continent.id)
      @temple.country_id = @country.id unless @country.nil?
      path_params[:country_id] = @country.id unless @country.nil?
      @state = State.find_by_id_and_country_id(params[:state_id], @country.id)
      @temple.state_id = @state.id unless @state.nil?
      path_params[:state_id] = @state.id unless @state.nil?
      @temple.update_attributes(params[:temple].permit([:name, :address, :link, :latitude, :longitude])) unless params[:temple].nil?
      if @temple.save
        redirect_to admin_temples_path
      else
        render 'new'
      end
    rescue
      redirect_to new_admin_temple_path(path_params)
    end
  end

  private

  def continent_options
    Continent.select("id, name").order(:name).inject([]) do |list, continent|
      list << [continent.name, continent.id]
    end
  end

  def country_options(continent)
    Country.select("id, name").order(:name).where(:continent_id => continent.id).inject([]) do |list, country|
      list << [country.name, country.id]
    end
  end

  def state_options(country)
    State.select("id, name").order(:name).where(:country_id => country.id).inject([]) do |list, state|
      list << [state.name, state.id]
    end
  end
end