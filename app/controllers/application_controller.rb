class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
   def index
    @business = Business.all
  end

  def import
    Business.import(params[:file])
    redirect_to root_url, notice: "Products imported."
  end
end

