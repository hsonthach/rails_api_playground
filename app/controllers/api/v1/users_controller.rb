class Api::V1::UsersController < Api::V1::BaseController
  wrap_parameters :user, include: %i[user_name password password_confirmation]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: User.find(params[:id])
  end

  # POST /users
  # REGISTERS
  def create
    @user = User.new(create_params)
    @user.save!
    token = JsonWebToken.encode({ user_id: @user.id })
    render json: { token: token, **UserSerializer.new(@user) }, status: :created
  rescue StandardError => e
    render json: @user.errors, status: :unprocessable_entity
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(update_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  def login
    @user = User.find_by(user_name: params[:user_name])

    if @user&.authenticate(params[:password])
      token = JsonWebToken.encode({ user_id: @user.id })
      render json: { token: token, **UserSerializer.new(@user) }
    else
      render json: { error: 'Invalid username or password' }, status: :bad_request
    end
  end

  def renew_token
    token = JsonWebToken.encode({ user_id: @user.id })
    render json: { token: token, **UserSerializer.new(@user) }
  end

  def voting_posts
    render json: { voting_posts: @user.users_vote_posts.map { |x| { vote_type: x.vote_type, post_id: x.post_id } } }
  end

  private

  # Only allow a list of trusted parameters through.
  def create_params
    params.require(:user).permit(:user_name, :password, :password_confirmation)
  end

  def update_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
