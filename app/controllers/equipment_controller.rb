class EquipmentController < ApplicationController
  def search
    if params[:search].present?
         @equipments = Equipment.search_equipment(params[:search][:query])
         @equipment = Equipment.geocoded

        @markers = @equipment.map do |equipment|
      {
        lat: equipment.latitude,
        lng: equipment.longitude
      }
      end 
    else
      @equipments = Equipment.all
      @equipment = Equipment.geocoded

      @markers = @equipment.map do |equipment|
      {
        lat: equipment.latitude,
        lng: equipment.longitude
      }
      end 
    end
  end

  def new
    @equipment = Equipment.new

  end

  def create
    @equipment = Equipment.new(equipment_params)
    @equipment.user = current_user
    if @equipment.save
      redirect_to equipment_path(@equipment), notice: "Your equipment has been created!"
    else
      flash[:alert] = "Oops! 😱 a problem has occurred while creating your equipment! Please try again."
      render :new
    end
  end

  def show
    @equipment = Equipment.find(params[:id])
    @booking = Booking.new
  end

  def own_equipment
    @equipment = current_user.equipment
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def equipment_params
    params.require(:equipment).permit(:name, :description, :price, :address, photos: [])
  end
end
