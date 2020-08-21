class BookingsController < ApplicationController
  def create
    @equipment = Equipment.find(params[:equipment_id])
    @booking = Booking.new(booking_params)
    @booking.equipment = @equipment
    @booking.user = current_user
    if @booking.save
      redirect_to own_bookings_path, notice: "Booking confirmed, waiting for the owner to accept!"

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
    @bookings = current_user.bookings
    @my_equipment = current_user.equipment
    @bookings_my_equipment = @my_equipment.map do |equipment|
      equipment.bookings
    end.flatten
  end

  def validate
    @booking = Booking.find(params[:id])

    @booking.update!(status: params[:commit])
    redirect_to own_bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status)
  end
end

