class AddColumnsToBooking < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :state, :string
    add_column :bookings, :equipment_sku, :string
    add_monetize :bookings, :amount, currency: { present: false} #WARNING not add_column but add_monetize because gem monetize.
    add_column :bookings, :checkout_session_id, :string
  end
end
