class AddPriceToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :price, :integer, :default => 20
  end
end
