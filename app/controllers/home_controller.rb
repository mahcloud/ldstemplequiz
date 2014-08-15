class HomeController < ApplicationController
  def index
    @countries = Country.all.order('name ASC')
  end
end