class Booking < ApplicationRecord

  belongs_to :equipment
  belongs_to :user

  STATUS =  ["pending", "cancelled", "approved", "rejected"]

  validates :status, inclusion: {in: Booking::STATUS}
  validates :start_date, :end_date, presence: true, availability: true
  validate :end_date_after_start_date
    monetize :amount_cents

   def booked_date_range
    { from: :start_date, to: :end_date }
  end


  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?
     if end_date < start_date
      errors.add(:end_date, "must be after the start date")
     end
  end
end

# || !self.id.nil?
