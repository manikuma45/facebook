class Message < ApplicationRecord
	mount_uploader :image, ImageUploader
	belongs_to :user
	has_many :nices, dependent: :destroy
	has_many :nice_users, through: :nices, source: :user
end
