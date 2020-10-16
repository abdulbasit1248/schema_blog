class User < ApplicationRecord
  include AuthHelper
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable
  has_many :blogs


  # def self.authenticate(email, password)
  #   athlete = find_for_authentication(email: email)
  #   return nil unless athlete.present?
  #   athlete.valid_password?(password) ? athlete : nil
  # end
end
