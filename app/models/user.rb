class User < ApplicationRecord
  extend Devise::Models # added this line to extend devise model
  # TODO: Add confirmation
  # https://stackoverflow.com/questions/35284854/testing-rails-api-for-sign-up-with-devise-error-missing-confirm-success-url/35285053
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable # ,:confirmable , :trackable
  include DeviseTokenAuth::Concerns::User

  has_many :voting_posts, through: :users_vote_posts, source: :post

  has_many :posts, dependent: :destroy
  has_many :following_subreddits, through: :users_follow_subreddits, source: :subreddit
end
