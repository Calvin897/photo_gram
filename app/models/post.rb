class Post < ApplicationRecord
    validates :user_id, presence: true
    validates :image, presence: true
    has_one_attached :image
    belongs_to :user
    has_many :comments, dependent: :destroy
    

end
