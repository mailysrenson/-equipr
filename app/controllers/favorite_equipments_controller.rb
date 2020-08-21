class FavoriteEquipmentsController < ApplicationController
  def create
    @favorite_equipment = FavoriteEquipment.new(user_id:current_user.id, equipment_id:params[:id])
    if @favorite_equipment.save
      redirect_to search_equipment_index_path
    else
      redirect_to new_equipment_path
    end
  end
end
