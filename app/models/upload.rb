class Upload < ApplicationRecord
  belongs_to :user
  belongs_to :project
  has_many_attached :uploads
  has_many :translates, dependent: :delete_all
  validates :uploads, attached: true
end
