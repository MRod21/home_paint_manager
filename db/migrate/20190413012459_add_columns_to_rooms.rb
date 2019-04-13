class AddColumnsToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :color, :string
    add_column :rooms, :brand, :string
    add_column :rooms, :sheen, :string
  end
end
