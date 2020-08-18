class Equipment < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many_attached :photos
  validates :description, presence: true
  validates :price, presence: true
  validates :price, numericality: true
  validates :name, presence: true

end
