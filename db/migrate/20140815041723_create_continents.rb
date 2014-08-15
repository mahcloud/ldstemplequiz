class CreateContinents < ActiveRecord::Migration
  def change
    create_table :continents do |t|
      t.string :name

      t.timestamps
    end

    add_index :continents, :name

    add_column :countries, :continent_id, :integer
    add_index :countries, :continent_id
  end
end
