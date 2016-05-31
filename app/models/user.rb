class User < ActiveRecord::Base
validates :name, presence: true, length: { maximum: 40 }
VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
validates :email, presence: true, length: { maximum: 235 },
          format: { with: VALID_EMAIL_REGEX },
          uniqueness: { case_sensitive: false }
end
