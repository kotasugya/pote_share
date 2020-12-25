class User < ApplicationRecord
  #user・reservationモデルとの関連づけ
  has_many :post, dependent: :destroy
  has_many :reservation, dependent: :destroy

  #各カラムへのvalidation
  validates :name, presence: true, length: {maximum: 30}
  validates :email, presence: true, length: {maximum: 255},
            uniqueness: true
            # format: { with: /\A[a-zA-Z]+\z/}
  has_secure_password
  validates :password, presence: true, length: {minimum: 8}
end
