class Product < ActiveRecord::Base

  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader

  belongs_to :category

  has_many :ratings

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :category, presence: true

  def description
    return "#{name} #{description} #{price_cents} #{quantity}." 
  end

end


# t.string   "name"
# t.text     "description"
# t.string   "image"
# t.integer  "price_cents"
# t.integer  "quantity"