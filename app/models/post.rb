class Post < ApplicationRecord
  attr_accessor :file_url, :subreddit_name

  belongs_to :subreddit, optional: true
  validate :validate_subreddit
  belongs_to :user
  has_many :comments
  has_one_attached :file
  validates :file, content_type: { in: [%r{\Aimage/.*\z}, %r{\Avideo/.*\z}] }, size: { less_than: 0.2.megabytes }

  include PgSearch::Model
  pg_search_scope :search_by_term, against: %i[title content],
                                   using: {
                                     tsearch: {
                                       any_word: true,
                                       prefix: true
                                     }
                                   }

  # before_save :add_subreddit_id, if: -> { subreddit_id.nil? }

  def validate_subreddit
    errors.add(:subreddit_id, 'Subreddit must be exist') if subreddit_name.nil? && subreddit_id.nil?
    self.subreddit_id ||= Subreddit.find_by(name: subreddit_name)&.id
    errors.add(:subreddit_id, 'Subreddit is not exist') if subreddit_id.nil?
  end

  def self.today(order: 'asc', page: 1, per_page: 25)
    Post.where(created_at: (Time.zone.now - 1.days)..Time.zone.now).order(upvote_count: order).page(page).per(per_page)
  end

  # FIXME: Why this only works no param was passed
  def self.all_time(order: 'asc', page: 1, per_page: 25)
    Post.order(upvote_count: order).page(page).per(per_page)
  end
end
