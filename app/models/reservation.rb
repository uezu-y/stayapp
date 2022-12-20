class Reservation < ApplicationRecord
  validates :startdate, presence: true
  validates :enddate, presence: true
  validates :number, presence: true
   
  mount_uploader :img, ImgUploader
  belongs_to :stay, optional: true
  belongs_to :user
  
def self.search(keyword)
  where(["room like? OR startdate like?", "%#{keyword}%", "%#{keyword}%"])
end
end
