class Resevation < ApplicationRecord
#user・postモデルとの関連付け
  belongs_to :user
  belongs_to :post

#各カラムへのvalidation
validates :start_date, presence: true
validates :end_date, presence: true
validates :num_people, presence: true
end


def post
  Post.find(self.post_id)
end