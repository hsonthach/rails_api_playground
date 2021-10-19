class Subreddit < ApplicationRecord
  has_many :users_follow_subreddits, dependent: :destroy
  has_many :followed_users, through: :users_follow_subreddits, source: :user
  has_many :posts, dependent: :destroy
  validates :name, presence: true, length: { maximum: 30, minimum: 6 }
  validates :name, format: { with: /\A[a-zA-Z0-9]+\Z/ }

  def self.search_by_name(search_name)
    where('name LIKE ?', "%#{search_name}%")
  end
end
