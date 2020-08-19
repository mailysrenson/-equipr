class BookingsController < ApplicationController
  def create
    @equipment = Equipment.find(params[:equipment_id])
    @booking = Booking.new(booking_params)
    @booking.equipment = @equipment
    @booking.user = current_user
    if @booking.save
      redirect_to equipment_path(@equipment)
    else
      render :new
    end
  end

  def new
    @equipment = Equipment.find(params[:equipment_id])
    @booking = Booking.new
  end

  def own_bookings
    @bookings = Booking.where(:user_id == current_user)
    @equipment = Equipment.all
    @bookings_my_equipment = @equipment.map do |equipment| 
      if equipment.user_id == current_user
        @bookings_my_equipment << equipment
      end
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status)
  end
end
