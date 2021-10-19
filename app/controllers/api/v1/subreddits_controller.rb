class Api::V1::SubredditsController < Api::V1::BaseController
  wrap_parameters :subreddit, include: %i[name]
  before_action :set_subreddit, only: %i[show follow unfollow]

  # GET /subreddits
  def index
    @subreddits = Subreddit.all

    render json: @subreddits
  end

  # GET /subreddits/1
  def show
    render json: @subreddit
  end

  # POST /subreddits
  def create
    @subreddit = Subreddit.new(subreddit_params)

    if @subreddit.save
      render json: @subreddit, status: :created
    else
      render json: @subreddit.errors, status: :unprocessable_entity
    end
  end

  def search
    @subreddits = Subreddit.search_by_name(subreddit_params[:name])
    render json: @subreddits
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_subreddit
    @subreddit = Subreddit.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def subreddit_params
    params.permit(:name)
  end
end
