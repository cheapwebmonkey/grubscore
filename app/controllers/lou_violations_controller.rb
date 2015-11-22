class LouViolationsController < ApplicationController
before_action :set_lou_violations, only: [:show]
  
  def index
    @lou_violations = LouViolation.page(params[:search])
    if @lou_violations == Array
    @lou_violations = Kaminari.paginate_array(lou_violations).page(params[:page]).per(10) 
    else
    @lou_violations = @lou_violations.page(params[:page]).per(10) # if @posts is AR::Relation object 
    end

  #code doesn't break pagination with kaminari
    @q = LouViolation.search(params[:q])

    @lou_violation = @q.result.page(params[:page]).per(10)
  end
 

  # GET /lou_violations/1
  # GET /lou_violations/1.json
  def show
    
    @lou_violations = LouViolation.find(params[:business_id])
    @lou_inspection = @lou_violations.lou_insepction
    @business = @lou_violation.business
  
  end


end


