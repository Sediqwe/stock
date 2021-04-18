class Upload < ApplicationRecord
  belongs_to :user
  has_many_attached :uploads
  validates :uploads, attached: true, content_type: ['text/plain']
end
