class User < ActiveRecord::Base
  attr_accessor :password
  attr_accessor :remember_token
  
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 40 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  has_secure_password
  
  #singleton class
  class << self
    #ハッシュ化
    def digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
      BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end
    
    #ランダムな文字列（トークン）を生成
    #特異クラス定義
    def new_token
      SecureRandom::urlsafe_base64
    end
    
    #remeber_digestを保存
    def remember
      self.remember_token = User.new_token
      update_attributes(:remember_digest, User.digest(remember_token))
    end
  end
  
  #cookieから参照したトークンとDBのハッシュ化された値を比較
  #認証処理
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
  
  def forget
    update_attributes(:remember_digest, nil)
  end

end
