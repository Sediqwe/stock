class Image < ApplicationRecord
    has_one_attached :image
    has_many :comments, dependent: :destroy
    validates :image, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg']
end
