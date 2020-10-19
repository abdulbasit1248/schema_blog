# class Api::V1::SessionsController < Api::V1::ApiController
#   def create 
#     @user = User.find_by(email: params[:email] )
    
#     if @user.valid_password?(params[:password])
#       # render json: user.as_json(only: [:id, :email, :authentication_token]), status: :created
#       # render :create, status: :created
#       render json: User::UserSerializer.new(current_user).serialized_json, status: :ok
#     else
#       head(:unauthorized)
#     end
#   end
  
#   def destroy
#   end
# end


class Api::V1::SessionsController < Api::V1::ApiController
  before_action :authenticate, only: [:update]

  def create
    @user = User.authenticate(params[:email], params[:password])
    return render json: { errors: ['Invalid email or password'] }, status: :unauthorized unless @user.present?
    render json: User::UserSerializer.new(@user).serialized_json, status: :created
  end

  def update
    render json: User::UserSerializer.new(current_user).serialized_json, status: :created
  end
end