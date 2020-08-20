class AvailabilityValidator < ActiveModel::EachValidator

  def validate_each(equipment, key, value)
    bookings = Booking.where(["equipment_id =?", equipment.id])
    date_ranges = bookings.map { |b| b.start_date..b.end_date }

    date_ranges.each do |range|
      if range.include? value
        record.errors.add(attribute, "not available")
      end
    end
  end
end
