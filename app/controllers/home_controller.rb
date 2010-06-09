class HomeController < ApplicationController
  def index
  end

  def welcome
    render :layout => false
  end

  def pages_highlight
    @page = Page.first
  end
  
  def products_highlight
    @products = Product.highlight
  end

  def broadcasts_highlight
    @broadcasts = Broadcast.highlight
  end
end
