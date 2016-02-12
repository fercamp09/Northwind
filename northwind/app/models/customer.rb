class Customer < ActiveRecord::Base
  has_many :orders, :dependent => :destroy, foreign_key: "CustomerID"
  scope :customer_id, -> (costumerName){ where ContactName: costumerName}
end
