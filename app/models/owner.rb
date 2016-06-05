class Owner < ActiveRecord::Base
  has_many :products, dependent: :destroy
  validates :name, presence: true, length: { maximum: 40 }
end
