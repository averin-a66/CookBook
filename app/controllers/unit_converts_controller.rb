class UnitConvertsController < ApplicationController
  def index
    @unit_converts = UnitConvert.all
  end

  def new
    @unit_convert = UnitConvert.new
  end

  def show
    @unit_convert = UnitConvert.find(params[:id])
  end

  def create
    @unit_convert = UnitConvert.new(unit_convert_params)

    if(@unit_convert.save)
      redirect_to unit_converts_path
    else
      render 'new'
    end
  end

  def edit
    @unit_convert = UnitConvert.find(params[:id])
  end

  def update
    @unit_convert = UnitConvert.find(params[:id])
    if(@unit_convert.update(unit_convert_params))
      redirect_to unit_converts_path
    else
      render 'edit'
    end
  end

  def destroy
    @unit_convert = UnitConvert.find(params[:id])
    @unit_convert.destroy

    redirect_to unit_converts_path
  end

  private def unit_convert_params
    params.require(:unit_convert).permit(:ratio,:unit_from_id, :unit_to_id )
  end
end
