class User < ActiveRecord::Base
	has_many :user_roles
  has_many :roles, through: :user_roles
  has_many :images
end
