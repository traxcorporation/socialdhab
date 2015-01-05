class Micropost < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  #140 characters allowed microposts
  validates :content, presence: true, length: { maximum: 140 }
end
