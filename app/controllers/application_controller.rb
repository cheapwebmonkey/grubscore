class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
   def index
    @products = Product.all
  end

  def import
    Product.import(params[:file])
    redirect_to root_url, notice: "Products imported."
  end
end

