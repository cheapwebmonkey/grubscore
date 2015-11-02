class LouViolationsController < ApplicationController
before_action :set_lou_violations, only: [:show]
  
  def index
    @lou_violations = LouViolation.all
  end
  
  def show
    @lou_violations = LouViolations.find(params[:business_id])
  end


  # GET /violations/new
  def new
    @lou_violation = LouViolation.new
  end


end