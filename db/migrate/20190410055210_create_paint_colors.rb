class CreatePaintColors < ActiveRecord::Migration
  def change
    create_table :paint_colors do |t|

      t.timestamps null: false
    end
  end
end
