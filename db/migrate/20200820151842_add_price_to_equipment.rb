class AddPriceToEquipment < ActiveRecord::Migration[6.0]
  def change
    add_monetize :equipment, :price, currency: { present: false}
  end
end
