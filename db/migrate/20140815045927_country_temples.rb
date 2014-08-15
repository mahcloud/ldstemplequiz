class CountryTemples < ActiveRecord::Migration
  def change
    add_column :temples, :country_id, :integer
    add_index :temples, :country_id
  end
end
