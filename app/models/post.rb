class Post < ApplicationRecord
	belongs_to :user
	validates :name, :content, :user_id, presence: true
	validates :name, uniqueness: true
end
