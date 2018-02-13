require 'carrierwave/orm/activerecord'
class Image < ActiveRecord::Base
	mount_uploader :avatar, AvatarUploader
	#serialize :avatar, JSON 
	belongs_to :user
	validates_presence_of :avatar
end
