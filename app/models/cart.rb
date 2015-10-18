class Cart < ActiveRecord::Base

  belongs_to :user
  has_many :cart_items

  def price_in_dollars
    self.price.to_i / 100.0
  end
end
