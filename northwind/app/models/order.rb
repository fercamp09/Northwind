class Order < ActiveRecord::Base
  scope :orders_users, -> (userID){ where CustomerID: userID }
  belongs_to :customer, :foreign_key => 'CustomerID'
  #has_many :order_details, dependent: :destroy, foreign_key: "OrderID"
  has_many :order_details, dependent: :destroy, foreign_key: "OrderID"
  has_many :products, through: :order_details, foreign_key: "ProductID"

end
