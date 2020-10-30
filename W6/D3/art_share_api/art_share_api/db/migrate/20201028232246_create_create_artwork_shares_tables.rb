class CreateCreateArtworkSharesTables < ActiveRecord::Migration[5.2]
  def change
    create_table :create_artwork_shares_tables do |t|
      t.integer :artwork_id, null: false 
      t.integer :viewer_id, null: false 
      t.timestamps
    end
    add_index :create_artwork_shares_tables, [:artwork_id, :viewer_id], unique: true
    add_index :create_artwork_shares_tables, :artwork_id
    add_index :create_artwork_shares_tables, :viewer_id
    rename_table :create_artwork_shares_tables, :artwork_shares
  end
end

#  rename_table :old_table_name, :new_table_name