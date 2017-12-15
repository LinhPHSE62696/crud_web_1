class Post < ApplicationRecord
	belongs_to :user
	mount_uploader :image, AttachmentUploader
	validates :name, :image, :content, :user_id, presence: true
	validates :name, uniqueness: true
end
