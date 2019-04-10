class CreatePaintColors < ActiveRecord::Migration
  def change
    create_table :paint_colors do |t|
      t.string :color_name
      t.string :brand
      t.string :color_number
      t.integer :room_id
    end
  end
end
