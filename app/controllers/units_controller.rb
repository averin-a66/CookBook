class UnitsController < ApplicationController
  def index
    @units = Unit.order(:name).all
  end

  def new
    @unit = Unit.new
  end

  def show
    @unit = Unit.find(params[:id])
  end

  def create
    @unit = Unit.new(unit_params)

    if(@unit.save)
      redirect_to units_path
    else
      render 'new'
    end
  end

  def edit
    @unit = Unit.find(params[:id])
  end

  def update
    @unit = Unit.find(params[:id])
    if(@unit.update(unit_params))
      redirect_to units_path
    else
      render 'edit'
    end
  end

  def destroy
    @unit = Unit.find(params[:id])
    @unit.destroy

    redirect_to units_path
  end

  private def unit_params
    params.require(:unit).permit(:name, :symbol, :unit_system_id, :unit_kind_id )
  end
end
