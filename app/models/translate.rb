class Translate < ApplicationRecord
  belongs_to :user
  has_many_attached :upload
end
