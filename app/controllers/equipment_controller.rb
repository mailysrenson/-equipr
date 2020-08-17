class EquipmentController < ApplicationController
  def search
    @equipments = Equipment.all
    @search_result = @equipments.where(name: params[:name])
  end

  def new
    @equipment = Equipment.new
  end

  def create
    @equipment = Equipment.new(equipment_params)
    @equipment.user = current_user
    @equipment.save


    redirect_to equipment_path(@equipment)
  end

  def show
    @equipment = Equipment.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def equipment_params
    params.require(:equipment).permit(:name, :description, :price)
  end
end
