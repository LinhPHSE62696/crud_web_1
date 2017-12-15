class User < ApplicationRecord
	has_many :posts
	has_secure_password
	validates :email, :username, :password, :role, presence: true
	validates :username, uniqueness: true

	def is_editable?
		self.role == "editor" || self.role == "admin"
	end

	def is_deletable?
		self.role == "admin"
	end

	def is_owner?
		self
	end
end
