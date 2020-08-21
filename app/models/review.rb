class Review < ApplicationRecord
  belongs_to :equipment
  validates :content, presence: true
  validates :rating, presence: true
  # validates :rating, inclusion: { in: (1..5).to_a.map(&:to_s)}, numericality: { only_integer: true }
end
