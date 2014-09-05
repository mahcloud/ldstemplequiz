class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name

      t.timestamps
    end

    add_index :teams, :name

    create_table :team_members do |t|
      t.integer :team_id
      t.integer :user_id
      t.boolean :leader, :default => false

      t.timestamps
    end

    add_index :team_members, :team_id
    add_index :team_members, :user_id
    add_index :team_members, :leader
  end
end
