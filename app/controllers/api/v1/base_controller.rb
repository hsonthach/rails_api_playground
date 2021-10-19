class Api::V1::BaseController < ActionController::API
  respond_to :json
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :authenticate_api_v1_user!

  def current_user
    current_api_v1_user
  end

  def validate_params
    validator = SearchParamsValidator.new(params)

    return if validator.valid?

    render json: { errors: validator.errors }, status: 422
  end
end
