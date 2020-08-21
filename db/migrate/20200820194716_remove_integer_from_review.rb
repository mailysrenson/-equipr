class RemoveIntegerFromReview < ActiveRecord::Migration[6.0]
  def change
    remove_column :reviews, :integer, :string
  end
end
