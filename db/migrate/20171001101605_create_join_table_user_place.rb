class CreateJoinTableUserPlace < ActiveRecord::Migration
  def change    
    create_table :users_places do |t|
      t.references :user, index: true, foreign_key: true
      t.references :place, index: true, foreign_key: true

      t.timestamps null: false
    end
  end  
end