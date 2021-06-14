class Post < ApplicationRecord
    validates :user_id, presence: true
    validates :image, presence: true
    has_many :likes, dependent: :destroy
    has_one_attached :image
    belongs_to :user
    has_many :comments, dependent: :destroy
    has_many :notices, dependent: :destroy
    
    scope :of_followed_users, -> (following_users) { where user_id: following_users }
end
