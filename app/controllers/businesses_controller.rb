class BusinessesController < ApplicationController
  before_action :require_user
  before_filter :set_search
  # before_action :set_businesses, only: [:show, :edit, :update, :destroy]


  # GET /businesses/new
  def new
    @business = Business.new
  end

  # GET /businesses.json
  def index
    @businesses = Business.page(params[:search])
    @businesses = Kaminari.paginate_array(@businesses).page(params[:page]).per(10)
     if @businesses.class == Array
    @businesses = Kaminari.paginate_array(@businesses).page(params[:page]).per(10) 
    else
    @businesses = @businesses.page(params[:page]).per(10)

 
    # if @businesses is AR::Relation object 
  end
   
   #code doesn't break pagination with kaminari
    @q = Business.search(params[:q])
    @businesses = @q.result.page(params[:page]).per(10)
  end
     
  

  # GET /businesses/1
  # GET /businesses/1.json
  def show
    @business = Business.find(params[:id])

  end

  def score
    @lou_inspections = lou_inspection.includes(:business)
    @lou_violations = LouViolation.score
    if @lou_violations.score == Array
      @businesses.score = LouViolation.array(@business)
    else
      @businesses = @businesses
      end 
  end

 

  # GET /businesses/1/edit
  def edit
    @business = Business.find(params[:id])
  end

  # POST /businesses
  # POST /businesses.json
  def create
    @business = Business.new(business_params)

    respond_to do |format|
      if @business.save
        session[:business_id] = @business.id
        format.html { redirect_to businesses_path, success: 'Thanks for adding your business!' }
        format.json { render action: 'show', status: :created, location: @business }
      else
        format.html { render action: 'new' }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /businesses/1
  # PATCH/PUT /businesses/1.json
  def update
    @business = Business.find(params[:id])
    respond_to do |format|
      if @business.update(business_params)
        format.html { redirect_to @business, notice: 'Business was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  def set_search
    @search=Business.search(params[:q])
  end

 # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @business = Business.find(params[:id])
    if @business.present?
        @business.destroy
    end
    redirect_to root_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_business
      @business = Business.find(params[:id])
    end

  end

    private

    # A list of the param names that can be used for filtering the Product list
    def filtering_params(params)
      params.slice(:business_id, :location, :starts_with)
    end


   


    # Never trust parameters from the scary internet, only allow the white list through.
    def business_params
      params.require(:business).permit(:name, :business_id, :address, :city, :state, :postal_code, :phone_number)
    end
