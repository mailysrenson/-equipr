class AddAddressToEquipment < ActiveRecord::Migration[6.0]
  def change
    add_column :equipment, :address, :text
  end
end
