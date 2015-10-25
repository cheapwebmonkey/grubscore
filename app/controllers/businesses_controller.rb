class BusinessesController < ApplicationController
  before_action :set_business, only: [:show, :edit, :update, :destroy]
   # GET /businesses
  # GET /businesses.json
  def index
    @businesses = Business.all
    # @businesses = Business.paginate(page: params[:page], per_page: 50)
    #  	respond_to do |format|
    #   	format.html  #index.html.erb
    #   	format.json { render json: @businesses }
    # end 
  end


  # GET /businesses/1
  # GET /businesses/1.json
  def show
    @businesses = Business.find(params[:business_id])
    @businesses = Business.order(:name).page params[:page]
  end


  # GET /businesses/new
  def new
    @business = Business.new
  end

  # GET /business/1/edit
  def edit
  end

    # POST /businesses
  # POST /business.json
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

    # PATCH/PUT /businesses/1
  # PATCH/PUT /businesses/1.json
  def update
    respond_to do |format|
      if @business.update(todo_list_params)
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_business
      @business = Business.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def business_params
      params.require(:business).permit(:name, :address)
    end

	end
end


