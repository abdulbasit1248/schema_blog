class User::BlogSerializer
  include FastJsonapi::ObjectSerializer
      attributes :id,
                  :title,
                  :description,
                  :user_id
end



# include FastJsonapi::ObjectSerializer
#   attributes :id,
#              :title, 
#              :description,
#              :user_id
#   # attribute :comments do |user|
#   #   User::CommentSerializer.new(user.comments)
#   # end
# end