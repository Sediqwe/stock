class Translate < ApplicationRecord
  belongs_to :user, optional: true
  has_many_attached :upload
  
end
