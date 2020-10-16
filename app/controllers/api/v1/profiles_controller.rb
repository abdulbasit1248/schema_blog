class Api::V1::ProfilesController < Api::V1::ApiController
  # include Imageable
  before_action :authenticate, only: [:show]

  def new
  end

  # def signed_url
  #   url = image_signed_url("profiles", params[:file_type])
  #   render json: { url: url.split('?').first, signed_url: url }, status: :ok
  # end

  def create
    @user = User.new(user_params)

    if @user.save
      # services = Service.order("RANDOM()").limit(3)
      # service_ids = services.pluck(:id)
      # ProvidedService.create!(user_id: @athlete.id, service_id: service_ids.first, duration: 1800000, name: "30 Minute Training")
      # ProvidedService.create!(athlete_id: @athlete.id, service_id: service_ids.second, duration: 2700000, name: "45 Minute Training")
      # ProvidedService.create!(athlete_id: @athlete.id, service_id: service_ids.third, duration: 3600000, name: "60 Minute Training")
      render json: User::UserSerializer.new(@user).serialized_json, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: User::UserSerializer.new(current_user).serialized_json, status: :ok
  end

  # def update
  #   if current_athlete.update(athlete_params)
  #     render json: Athlete::AthleteSerializer.new(current_athlete).serialized_json, status: :created
  #   else
  #     render json: current_athlete.errors, status: :unprocessable_entity
  #   end
  # end

  # def check_email_or_phone
  #   return render json: { result: true }, status: :ok if Athlete.exists?(email: params[:email]) || Athlete.exists?(contact_number: params[:contact_number])
  #   render json: { result: false }, status: :ok
  # end

  # def connect_account
  #   if current_athlete.update(athlete_params)
  #     response = CreateStripeAccount.call(current_athlete)
  #     if response == true
  #       render json: Athlete::AthleteSerializer.new(current_athlete).serialized_json, status: :created
  #     else
  #       unprocessable_entity response
  #     end
  #   else
  #     render json: current_athlete.errors, status: :unprocessable_entity
  #   end
  # end

  # def send_reset_password
  #   if params[:athlete][:email].present? && params[:athlete][:url].present?
  #     @athlete = Athlete.find_by_email(params[:athlete][:email])
  #     if @athlete.present?
  #       Athletes::ResetPasswordMailer.reset_password(params[:athlete][:email], params[:athlete][:url]).deliver_now
  #       render json: { response: "Email has sent to reset password" }, status: :ok
  #     else
  #       unprocessable_entity 'Athlete not found'
  #     end
  #   else
  #     unprocessable_entity 'Something bad happened'
  #   end
  # end

  # def update_password
  #   @athlete = Athlete.find_by_email(params[:athlete][:email])
  #   if @athlete.present?
  #     @athlete.password = params[:athlete][:password]
  #     @athlete.password_confirmation = params[:athlete][:password_confirmation]
  #     @athlete.save(validate: false)
  #     if @athlete.valid?
  #       render json: Athlete::AthleteSerializer.new(@athlete).serialized_json, status: :ok
  #     else
  #       unprocessable_entity @athlete.errors
  #     end
  #   else
  #     unprocessable_entity 'Athlete not found'
  #   end
  # end

  private
    def user_params
      params.require(:user).permit(
        :email,
        :first_name,
        :last_name,
        # :city,
        # :contact_number,
        # :postal_code,
        # :street,
        # :social_security_number,
        # :license_number,
        :password,
        :password_confirmation,
        # :dob,
        # :account_id,
        # :account_number,
        # :routing_number,
        # :ssn_last_4,
        # :address,
        # :gender,
        # :base_price,
        # :profile_title,
        # :profile_description,
        # :height,
        # :weight,
        # :willing_to_travel,
        # :profile_image,
        # :apt_unit,
        # :state,
        # :short_address,
        # :school_id,
        # :first_visit,
        # :slug,
        # provided_services_attributes: [:id, :service_id, :price, :discription, :duration, :image_url],
        # videos_attributes: [:id, :url]
      )
    end

    # def password_params
    #   params.require(:athlete).permit(:password, :password_confirmation, :email)
    # end
end