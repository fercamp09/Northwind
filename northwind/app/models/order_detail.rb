class OrderDetail < ActiveRecord::Base
  scope :find_by_id, -> (orderID){ where OrderID: orderID}
  after_destroy :log_destroy_action
  belongs_to :order, :foreign_key => "OrderID"
  belongs_to :product,:foreign_key => "ProductID"
  #self.primary_key = 'OrderD'
  self.primary_keys = 'OrderID', 'ProductID'

  def log_destroy_action
    puts 'Order destroyed'
  end
end
