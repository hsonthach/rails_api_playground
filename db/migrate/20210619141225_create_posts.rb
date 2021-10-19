class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.references :subreddit, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :title, null: false, limit: 120
      t.string :content, limit: 10_000
      t.integer :upvote_count, default: 1
      t.timestamps
    end
  end
end
