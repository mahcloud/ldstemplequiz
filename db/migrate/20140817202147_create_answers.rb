class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :user_id
      t.integer :temple_id
      t.integer :guess_id
      t.boolean :correct

      t.timestamps
    end

    add_index :answers, :user_id
    add_index :answers, :temple_id
    add_index :answers, :guess_id
    add_index :answers, :correct
  end
end
