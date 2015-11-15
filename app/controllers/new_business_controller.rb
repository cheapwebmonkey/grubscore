class NewBusinessController < ApplicationController
  def index
    @new_business = Business.find(params[:id])
  end

  def new
    @business = Business.find(params[:id])
    @new_business = @businesses.new_business.new
  end

  def create
    @business = Business.find(params[:id])
    @new_business = @businesses.new_business.new(new_params)
    if @new_business.save
      flash[:success] = "Added new business."
      redirect_businesses_new_business_path
    else
      flash[:error] = "There was a problem adding that business."
      render action: :new
    end
  end

  private
  def new_business_params
    params[:new_business].permit(:content)
  end

end