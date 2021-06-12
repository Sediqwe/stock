class Upload < ApplicationRecord
  belongs_to :user
  has_many_attached :uploads
  belongs_to :translates
  validates :uploads, attached: true, content_type: ['text/plain']
end
