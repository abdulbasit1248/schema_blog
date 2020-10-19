class User < ApplicationRecord
  include AuthHelper
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable
  has_many :blogs


  def self.authenticate(email, password)
    user = find_for_authentication(email: email)
    return nil unless user.present?
    user.valid_password?(password) ? user : nil
  end
end
