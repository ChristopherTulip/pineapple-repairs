class DevicesController < ApplicationController
  before_filter :redirect_if_not_authenticated, execpt: [:index]
  before_filter :redirect_if_not_verified, execpt: [:index]
  before_filter :redirect_if_not_admin, execpt: [:index]

  def index
    @devices = Device.all
  end

  def new
    @device = Device.new
  end

  def create
    @device = Device.new(device_params)
    if @device.save
      redirect_to root_path, notice: "device successfully created"
    else
      render :new
    end
  end

  def destroy
    @device = Device.find(params[:id])
    @device.destroy
  end

  def edit
    @device = Device.find(params[:id])
  end

  def update
    @device = Device.update(device_params)
  end

 private

  def device_params
    params.require(:device).permit(:name, :avatar)
  end
end
