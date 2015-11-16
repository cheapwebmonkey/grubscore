class BusinessesController < ApplicationController
  before_action :require_user
  # before_action :set_businesses, only: [:show, :edit, :update, :destroy]


  # GET /businesses/new
  def new
    @business = Business.new
  end

  # GET /businesses.json
  def index
    @businesses = Business.all
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
    @business = Business.find(params[:id])
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def business_params
      params.require(:business).permit(:name, :address, :city, :state, :postal_code, :phone_number)
    end
end