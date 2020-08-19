class BookingsController < ApplicationController
  def create
    @equipment = Equipment.find(params[:equipment_id])
    @booking = Booking.new(booking_params)
    @booking.equipment = @equipment
    @booking.user = current_user
    if @booking.save
      redirect_to equipment_path(@equipment), notice: "Booking confirmed, waiting for the owner to accept!"

    else
      flash[:alert] = "Please select other dates that are available!"
      render :new
    end
  end

  def new
    @equipment = Equipment.find(params[:equipment_id])
    @booking = Booking.new
  end

  def own_bookings
    @bookings = Booking.where(:user_id == current_user)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status)
  end
end
