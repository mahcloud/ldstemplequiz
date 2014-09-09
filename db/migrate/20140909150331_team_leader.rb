class TeamLeader < ActiveRecord::Migration
  def change
    remove_column :team_members, :leader
    add_column :teams, :leader_id, :integer
  end
end
