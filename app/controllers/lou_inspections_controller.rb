class LouInspectionsController < ApplicationController
before_action :set_lou_inspections, only: [:show]
  
  def index
    @lou_inspections = LouInspection.all
  end
  
  def show
    @lou_inspections = LouInspections.find(params[:business_id])
  end

   def show
  end

  # GET /businesses/new
  def new
    @lou_inspection = LouInspection.new
  end
end