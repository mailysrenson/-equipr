class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :equipment
  has_many :bookings, dependent: :destroy
  has_one_attached :photo

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Favorite equipment of user
  has_many :favorite_equipment # just the 'relationships'
  has_many :favorites, through: :favorite_equipment, source: :equipment
end

