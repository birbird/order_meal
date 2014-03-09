class Product < ActiveRecord::Base
  has_many :quotum, :dependent => :destroy
  
  def today_quantity
    quota = self.quotum.where(:_date => DateTime.now.to_date).first
    return quota && quota.quantity
  end

end
