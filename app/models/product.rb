class Product < ActiveRecord::Base
  has_many :reviews
  belongs_to :category

  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :category, presence: true

  def avg_rating 
    avg_rating = self.reviews.average(:rating)
    return avg_rating ? avg_rating.round(1) : nil 
  end
  
end
