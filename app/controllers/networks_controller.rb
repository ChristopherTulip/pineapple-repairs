class NetworksController < ApplicationController
  before_filter :redirect_if_not_authenticated, execpt: [:index]
  before_filter :redirect_if_not_verified, execpt: [:index]
  before_filter :redirect_if_not_admin, execpt: [:index]

  def new
    @network = Network.new
  end

  def create
    @network = Network.new(network_params)

    if @network.save
      redirect_to root_path, notice: "network successfully created"
    else
      render :new
    end
  end

  def destroy
    @network = Network.find(params[:id])
    @network.destroy
  end

  def edit
    @network = Network.find(params[:id])
  end

  def update
    @network = Network.find(params[:id])
    if @network.update(network_params)
      redirect_to root_path, notice: "network successfully updated"
    else
      render :edit, notice: "network failed to update"
    end
  end

private

  def network_params
    params.require(:network).permit(:name, :avatar)
  end
end
