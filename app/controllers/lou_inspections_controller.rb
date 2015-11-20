class LouInspectionsController < ApplicationController
before_action :set_lou_inspections, only: [:show]
  
  def index
    @lou_inspections = LouInspection.page(params[:search])
    if @lou_inspections == Array
    @lou_inspections = Kaminari.paginate_array(lou_inspections).page(params[:page]).per(10) 
    else
    @lou_inspections = @lou_inspections.page(params[:page]).per(10) # if @posts is AR::Relation object 
    end

  end

  # GET /louinspections/1
  # GET /louinspections/1.json
  def show
    
    @lou_inspections = LouInspection.find(params[:business_id])
    @lou_violation = @lou_inspection.lou_violation
    @business = @lou_inspection.business
  
  end


end