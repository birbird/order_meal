class Product < ActiveRecord::Base
  has_many :quotum, :dependent => :destroy
  has_many :orders
  
  def today_quantity
    quota = self.quotum.where(:_date => DateTime.now.to_date).first
    sold = self.orders.where(:_date => DateTime.now.to_date).sum("count")
    return quota && (quota.quantity - sold)
  end

end
