class LouInspectionsController < ApplicationController
before_action :set_lou_inspections, only: [:show]
  
  def index
    @lou_inspections = LouInspection.page(params[:search])
    if @lou_inspections == Array
    @lou_inspections = Kaminari.paginate_array(lou_inspections).page(params[:page]).per(10) 
    else
    @lou_inspections = @lou_inspections.page(params[:page]).per(10) # if @posts is AR::Relation object 
    end

#code doesn't break pagination with kaminari
    @q = LouInspection.search(params[:q])

    @lou_inspections = @q.result.page(params[:page]).per(10)
  end

 
  def new
    @lou_inspection = LouInspection.new
  end

  # GET /louinspections/1
  # GET /louinspections/1.json
  def show
    
    @lou_inspections = LouInspection.find(params[:id])
    @businesses = @lou_inspection.lou_violation
    @business = @lou_inspection.business
  
  end

  # POST /lou_inspection
  # POST /lou_inspection.json
  def create
    @lou_inspection = LouInspection.new(lou_inspection_params)

    respond_to do |format|
      if @lou_inspection.save
        session[:lou_inspection_id] = @lou_inspection.id
        format.html { redirect_to root_path, success: 'Thanks for adding your inspection!' }
        format.json { render action: 'show', status: :created, location: @lou_inspection }
      else
        format.html { render action: 'new' }
        format.json { render json: @lou_inspection.errors, status: :unprocessable_entity }
      end
    end
  end

end

private
    # Use callbacks to share common setup or constraints between actions.
    def set_lou_inspection
      @lou_inspection = LouInspection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lou_inspection_params
      params.require(:lou_inspection).permit(:business_id, :score, :date, :visit)
    end

