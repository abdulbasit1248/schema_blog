class User::UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :first_name, :last_name, :email, :auth_token
end