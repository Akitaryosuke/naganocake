class Item < ApplicationRecord

  has_one_attached :image
  belongs_to :genre, optional: true
  has_many :cart_items
  has_many :order_details

  def add_tax_price
    (self.price * 1.10).round
  end

end
