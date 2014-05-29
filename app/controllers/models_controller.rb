class ModelsController < ApplicationController
  before_filter :redirect_if_not_authenticated, execpt: [:index]
  before_filter :redirect_if_not_verified, execpt: [:index]
  before_filter :redirect_if_not_admin, execpt: [:index]

  def new
    @model = Model.new
  end

  def create
    @model = Model.new(model_params)

    if @model.save
      redirect_to root_path, notice: "model successfully created"
    else
      render :new
    end
  end

  def destroy
    @model = Model.find(params[:id])
    @model.destroy
  end

  def edit
    @model = Model.find(params[:id])
  end

  def update
    @model = Model.find(params[:id])
    if @model.update(model_params)
      redirect_to root_path, notice: "model successfully updated"
    else
      render :edit, notice: "model failed to update"
    end
  end

 private

  def model_params
    params.require(:model).permit(:name, :device_id, :time, :price, :avatar)
  end
end
