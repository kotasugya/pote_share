class Post < ApplicationRecord
  #user・reservationモデルとの関連付け
  belongs_to :user
  has_many :resevation
  has_one_attached :image

  #各へのvalidation
  validates :room_name, presence: true
  validates :room_PR, presence: true
  validates :room_price, presence: true
  validates :room_address, presence: true

  def Post.search_area(search_area)
    Post.where(['room_address LIKE ?', "%#{search_area}%"])
  end

  def Post.search_keyword(search_keyword)
    Post.where(['room_name LIKE ? OR room_PR LIKE ? OR room_address LIKE ?',
                "%#{search_keyword}%", "%#{search_keyword}%", "%#{search_keyword}%"])
  end

end
