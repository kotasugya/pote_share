class Post < ApplicationRecord
  #user・reservationモデルとの関連付け
  belongs_to :user
  has_many :resevation

  #各へのvalidation
  validates :user_id, presence: true
  validates :room_name, presence: true
  validates :room_PR, presence: true
  validates :room_price, presence: true
  validates :room_address, presence: true

  def Post.search(search)
    Post.where(['room_address LIKE ?', "%#{search}%"])
  end

end
