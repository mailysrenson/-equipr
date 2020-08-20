class RemovePriceFromEquipment < ActiveRecord::Migration[6.0]
  def change
    remove_column :equipment, :price, :float
  end
end
