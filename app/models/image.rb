class Image < ApplicationRecord
    has_many :comments, dependent: :destroy
    has_one_attached :image
    validates :image, content_type: ['image/png', 'image/jpg', 'image/jpeg']
    has_many_attached :photos
    validates :photos, content_type: ['image/png', 'image/jpg', 'image/jpeg']

end
