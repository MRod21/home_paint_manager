class DeletePaintColorsTable < ActiveRecord::Migration
  def change
    drop_table :paint_colors
  end
end
