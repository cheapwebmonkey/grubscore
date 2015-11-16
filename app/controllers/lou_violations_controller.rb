class LouViolationsController < ApplicationController
before_action :set_lou_violations, only: [:show]
  
  def index
    @lou_violations = LouViolation.page(params[:page])
  end
  
  def show
    @lou_violation = LouViolation.find(params[:id])
    @lou_inspection = @lou_violation.lou_inspection
    @business = @lou_violation.business
  end


  # GET /violations/new
  def new
    @lou_violation = LouViolation.new
  end


end