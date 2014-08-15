class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :link
      t.integer :temple_id

      t.timestamps
    end

    add_index :photos, :temple_id
  end
end
