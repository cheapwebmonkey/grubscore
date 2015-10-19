require 'securerandom'

class User < ActiveRecord::Base
	validates :password, presence: true, length: {in: 7..100}
	before_validate :ensure_password_exists

	def ensure_password_exists
		self.password ||= SecureRandom.urlsafe_base64
	end
end
