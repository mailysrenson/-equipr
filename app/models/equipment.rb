class Equipment < ApplicationRecord

  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many_attached :photos
  validate :check_minimal_one_picture
  validates :address, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :price, numericality: true
  validates :name, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  monetize :price_cents

  include PgSearch::Model
  pg_search_scope :search_equipment,
    against: [:description, :name],
    associated_against: {
      user: [:first_name]
    },
    using: {
      tsearch: { prefix: true}
    }

   def unavailable_dates
    bookings.pluck(:start_date, :end_date).map do |range|
      { from: range[0].strftime("%d-%m-%Y"), to: range[1].strftime("%d-%m-%Y") }
    end
  end


  private

  def check_minimal_one_picture
    if photos.attached? == false
    errors.add(:photos, "Please upload at least one picture")
    end
  end
end
