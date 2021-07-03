class Upload < ApplicationRecord
  belongs_to :user
  has_many_attached :uploads
  has_many :translates, dependent: :delete_all
  validates :uploads, attached: true, content_type: ['text/plain']
end
