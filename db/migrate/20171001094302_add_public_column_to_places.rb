class AddPublicColumnToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :public, :boolean, default: false
  end
end
