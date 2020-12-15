class Post < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :room_name, presence: true
  validates :room_PR, presence: true
  validates :room_price, presence: true
  validates :room_address, presence: true

end
