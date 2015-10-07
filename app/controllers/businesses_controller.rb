class BusinessesController < ApplicationController
  def index
    @businesses = Business.all
  end
  
  def show
    @businesses = Business.find(params[:business_id])
  end
end