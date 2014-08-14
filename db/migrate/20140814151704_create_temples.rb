class CreateTemples < ActiveRecord::Migration
  def change
    create_table :temples do |t|
      t.string :name
      t.string :address
      t.integer :state_id
      t.string :latitude
      t.string :longitude
      t.string :link

      t.timestamps
    end

    add_index :temples, :state_id
  end
end
