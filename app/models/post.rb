class Post < ApplicationRecord
  belongs_to :user
  has_many :bulletin_boards, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  validates :genre, presence: true
  validates :title, presence: true
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  
  def self.search(search)
      if search
        Post.where(['genre LIKE ?', "%#{search}%"])
      else
        following_ids = "SELECT followed_id FROM relationships
                     WHERE follower_id = :user_id"
        Post.where("user_id IN (#{following_ids})
                     OR user_id = :user_id", user_id: id)
      end
  end
  
end
