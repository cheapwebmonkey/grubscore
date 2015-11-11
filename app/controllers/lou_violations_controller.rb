class LouViolationsController < ApplicationController
before_action :set_lou_violations, only: [:show]
  
  def index
    @lou_violations = LouViolation.page(params[:page])
  end
  
  def show
  end


  # GET /violations/new
  def new
    @lou_violation = LouViolation.new
  end


end