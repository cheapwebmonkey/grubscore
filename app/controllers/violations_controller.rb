class LouViolationsController < ApplicationController
  def index
    @louviolations = louviolations.all
  end
  
  def show
    @louviolations = LouViolations.find(params[:business_id])
  end
end