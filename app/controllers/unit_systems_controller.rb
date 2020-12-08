class UnitSystemsController < ApplicationController
  def index
    @unit_systems = UnitSystem.all
  end

  def new
    @unit_system = UnitSystem.new
  end

  def create
    @unit_system = UnitSystem.new(unit_system_params)
    if(@unit_system.save)
      redirect_to @unit_system
    else
      render 'new'
    end
  end

  def update
    @unit_system = UnitSystem.find(params[:id])
    if(@unit_system.update(unit_system_params))
      redirect_to @unit_system
    else
      render 'edit'
    end
  end

  def edit
    @unit_system = UnitSystem.find(params[:id])
  end

  def show
    @unit_system = UnitSystem.find(params[:id])
  end

  def destroy
    @unit_system = UnitSystem.find(params[:id])
    @unit_system.destroy

    redirect_to unit_systems_path
  end

  private def unit_system_params
    params.require(:unit_system).permit(:title,:comment)
  end

end
