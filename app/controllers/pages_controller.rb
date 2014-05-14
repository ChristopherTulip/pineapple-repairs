class PagesController < ApplicationController

  def index
    @devices = Device.all
  end

  def about
  end

  def products
  end

end
