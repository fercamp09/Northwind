class Product < ActiveRecord::Base
  has_many :order_details, foreign_key: "ProductID"
  has_many :orders, through: :order_details, foreign_key: "OrderID"
  scope :ProductName, -> (productID){ where productID: productID}
end
