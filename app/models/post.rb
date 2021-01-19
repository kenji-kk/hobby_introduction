class Post < ApplicationRecord
  belongs_to :user
  has_many :bulletin_boards, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  validates :genre, presence: true
  validates :title, presence: true
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
end
