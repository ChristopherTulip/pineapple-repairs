class PagesController < ApplicationController

  def index
    @devices = Device.all
  end

  def about
  end

  def diy
  end

  def mail_in
  end

  def after_sign_up
  end

end
