class AddEquipmentToReviews < ActiveRecord::Migration[6.0]
  def change
    add_reference :reviews, :equipment, null: false, foreign_key: true
  end
end
