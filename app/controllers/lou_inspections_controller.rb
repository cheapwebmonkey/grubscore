class LouInspectionsController < ApplicationController
before_action :set_lou_inspections, only: [:show]
  
  def index
    @lou_inspections = LouInspection.page(params[:page])

    # @lou_inspections = LouInspection.all
    # if params[:search]
    #   @lou_inspections = LouInspection.search(params[:search]).order("created_at DESC")
    # else
    #   @lou_inspections = LouInspection.all.order('created_at DESC')
    # end
  end

  # GET /louinspections/1
  # GET /louinspections/1.json
  def show
  end


end