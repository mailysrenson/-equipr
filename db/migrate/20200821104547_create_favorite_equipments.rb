class CreateFavoriteEquipments < ActiveRecord::Migration[6.0]
  def change
    create_table :favorite_equipments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :equipment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
