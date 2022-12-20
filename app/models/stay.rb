class Stay < ApplicationRecord
  validates :room, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :address, presence: true
  validates :img, presence: true
  
  mount_uploader :img, ImgUploader
  has_many :reservations
  belongs_to :user
end
