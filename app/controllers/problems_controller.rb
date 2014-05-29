class ProblemsController < ApplicationController
  before_filter :redirect_if_not_authenticated, execpt: [:index]
  before_filter :redirect_if_not_verified, execpt: [:index]
  before_filter :redirect_if_not_admin, execpt: [:index]

  def new
    @problem = Problem.new
  end

  def create
    @problem = Problem.new(problem_params)

    if @problem.save
      redirect_to root_path, notice: "problem successfully created"
    else
      render :new
    end
  end

  def destroy
    @problem = Problem.find(params[:id])
    @problem.destroy
  end

  def edit
    @problem = Problem.find(params[:id])
  end

  def update
    @problem = Problem.find(params[:id])
    if @problem.update(problem_params)
      redirect_to root_path, notice: "problem successfully updated"
    else
      render :edit, notice: "problem failed to update"
    end
  end

 private

  def problem_params
    params.require(:problem).permit(:name, :avatar)
  end
end
