class Booking < ApplicationRecord
  belongs_to :equipment
  belongs_to :user

  STATUS =  ["pending", "cancelled", "approved", "rejected"]

  validates :status, inclusion: {in: STATUS}, presence: true, default: "pending"
  validates :start_date, :end_date, presence: true, availability: true
  validate :end_date_after_start_date
  validate :validate_dates

  def validate_dates
    errors.add(:start_date, "can't start before today!") if (start_date < Date.today)
    bookings = Booking.where(["equipment_id =?", self.equipment_id])
    date_ranges = bookings.map { |b| b.start_date..b.end_date }

    date_ranges.each do |range|
      if range.include? value
        self.errors.add(:start_date, "not available")
      end
    end
  end

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?
     if end_date < start_date
      errors.add(:end_date, "must be after the start date")
     end
  end
end
