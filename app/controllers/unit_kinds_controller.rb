class UnitKindsController < ApplicationController
  def index
    @unit_kinds = UnitKind.order(:name).all
  end

  def new
    @unit_kind = UnitKind.new
  end

  def show
    @unit_kind = UnitKind.find(params[:id])
  end

  def create
    @unit_kind = UnitKind.new(unit_kind_params)

    if(@unit_kind.save)
      redirect_to unit_kinds_path
    else
      render 'new'
    end
  end

  def edit
    @unit_kind = UnitKind.find(params[:id])
  end

  def update
    @unit_kind = UnitKind.find(params[:id])
    if(@unit_kind.update(unit_kind_params))
      redirect_to unit_kinds_path
    else
      render 'edit'
    end
  end

  def destroy
    @unit_kind = UnitKind.find(params[:id])
    @unit_kind.destroy

    redirect_to unit_kinds_path
  end

  private def unit_kind_params
    params.require(:unit_kind).permit(:name, :is_can_convert )
  end
end
