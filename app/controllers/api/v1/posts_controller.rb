# frozen_string_literal: true

class Api::V1::PostsController < Api::V1::BaseController
  load_and_authorize_resource
  before_action :validate_params, only: :index

  # GET /posts
  def index
    @posts = Post.where(created_at: search_params[:start_date]..search_params[:end_date])
                 .order(created_at: :desc).page(1).per(10).includes(file_attachment: :blob)
    # @posts = Post.search_by_term(params[:query]).includes(file_attachment: :blob)
    render json: PostSerializer.new(@posts)
  end

  # GET /posts/1
  def show
    render json: PostSerializer.new(@post)
  end

  # POST /posts
  def create
    @post = Post.new(**create_params, user_id: current_user.id)
    if @post.save
      render json: @post, status: :created
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    # TODO: Handle access denied error AccessDenied
    if @post.update(**update_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def create_params
    params.permit(:subreddit_id, :title, :content, :subreddit_name, :file)
  end

  def update_params
    params.permit(:title, :content)
  end

  def search_params
    params.permit(:start_date, :end_date, :order_by, :page, :per)
  end
end
