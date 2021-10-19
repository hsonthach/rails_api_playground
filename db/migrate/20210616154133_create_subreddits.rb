class CreateSubreddits < ActiveRecord::Migration[6.1]
  def change
    create_table :subreddits do |t|
      t.string :name
      t.integer :following, default: 0

      t.timestamps
    end
    add_index :subreddits, :name, unique: true
  end
end
