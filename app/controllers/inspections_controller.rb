class LouInspectionsController < ApplicationController
  def index
    @louinspections = louinspections.all
  end
  
  def show
    @louinspections = LouInspections.find(params[:business_id])
  end
end