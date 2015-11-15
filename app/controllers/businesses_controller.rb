class BusinessesController < ApplicationController
  before_action :require_user
  before_action :set_businesses, only: [:show, :edit, :update, :destroy]


  # GET /businesses

  # GET /businesses.json
  def index
    @businesses = Business.page(params[:page])
    # @businesses = Business.all
    # @businesses = Business.order(:name).index params[:page]

    # # Kaminari.configure do |config|
    # # config.page_method_name = :per_page_kaminari
    # # end

    # #@businesses = Business.order(:name).page params[:page]

    # if params[:search]
    #   @businesses = Business.search(params[:search]).order("created_at DESC")
    # else
    #   @businesses = Business.all.order('created_at DESC')
    # end
  end

  # GET /businesses/1
  # GET /businesses/1.json
  def show
    #@businesses = Business.order(:name).page params[:page]
  end

  # GET /businesses/new
  def new
    @business = Business.new
  end

  # GET /businesses/1/edit
  def edit
  end

  # POST /businesses
  # POST /businesses.json
  def create
    @business = Business.new(business_params)

    respond_to do |format|
      if @business.save
        format.html { redirect_to @business, notice: 'Business was successfully created.' }
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

  # DELETE /businesses/1
  # DELETE /businesses/1.json
  def destroy
    @business.destroy
    respond_to do |format|
      format.html { redirect_to businesses_url }
      format.json { head :no_content }
    end
  end

    def inspections
    @lou_inpsections = LouInspeciton.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_business
      @business = Business.find(params[:business_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def business_params
      params.require(:business).permit(:name, :address, :city, :state, :postal_code)
    end
end