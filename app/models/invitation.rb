class Invitation < ApplicationRecord
  belongs_to :user, :foreign_key => "user_id", :class_name => "User"
  belongs_to :inviter, :foreign_key => "inviter_id", :class_name => "User"
end
