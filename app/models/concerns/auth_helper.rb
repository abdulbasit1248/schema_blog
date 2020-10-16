require 'bcrypt'

module AuthHelper
  include BCrypt
  attr_accessor :pin

  def auth_token
    # if self.class.name == 'Athlete'
    #   JsonWebToken.encode({ athlete_id: self.id, exp: auth_expires_at })
    # else
    #   JsonWebToken.encode({ client_id: self.id, exp: auth_expires_at })
    # end

    JsonWebToken.encode({ user_id: self.id, exp: auth_expires_at })
  end

  def regenerate_auth_token
    # if self.class.name == 'Athlete'
    #   JsonWebToken.encode({ athlete_id: self.id, exp: update_token_expire_time })
    # else
    #   JsonWebToken.encode({ client_id: self.id, exp: update_token_expire_time })
    # end
    JsonWebToken.encode({ user_id: self.id, exp: update_token_expire_time })
  end

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def auth_password
    @auth_password ||= Password.new(encrypted_password)
  end

  def auth_password=(new_password)
    @auth_password = Password.create(new_password)
    self.encrypted_password = @auth_password
  end

  def logged_in!
    unless self.active? && self.signed_up_at.present?
      self.signed_up_at = DateTime.current
      self.admin_greetings!
    end
    self.active = true
    self.increment(:sign_in_count, 1).save
  end

  private
    def auth_expires_at
      return self.token_expires_at.to_i if self.token_expires_at.present?
      update_token_expire_time
    end

    def update_token_expire_time
      expire_time = Time.now.to_i + 2.month
      self.update token_expires_at: expire_time
      expire_time
    end
end