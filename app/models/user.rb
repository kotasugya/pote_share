class User < ApplicationRecord
  #userモデルとの関連づけ
  has_many :post, dependent: :destroy
  
  #各カラムへのvalidation
  validates :name, presence: true, length: {maximum: 30}
  validates :email, presence: true, length: {maximum: 255},
            uniqueness: true
  has_secure_password
  validates :password, presence: true, length: {minimum: 8}
end
