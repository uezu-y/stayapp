class Reservation < ApplicationRecord
  validates :startdate, presence: true
  validates :enddate, presence: true
  validates :number, presence: true
  
  validate :after_today
  def after_today
      if startdate < Date.today
        errors.add(:base, '過去の日付は無効です。')
      elsif enddate < startdate
        errors.add(:base,"終了日は開始日以降の日付を選択して下さい")
      end
  end
  
  mount_uploader :img, ImgUploader
  belongs_to :stay, optional: true
  belongs_to :user
  
def self.search(keyword)
  where(["room like? OR startdate like?", "%#{keyword}%", "%#{keyword}%"])
end
end
