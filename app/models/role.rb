class Role < ActiveRecord::Base
  has_many :user_roles
  has_many :users, through: :user_roles
  validates_uniqueness_of :role_name
end
