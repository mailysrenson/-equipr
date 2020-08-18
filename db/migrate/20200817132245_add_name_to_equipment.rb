class AddNameToEquipment < ActiveRecord::Migration[6.0]
  def change
    add_column :equipment, :name, :text
  end
end
