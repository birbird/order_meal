class Order < ActiveRecord::Base
  has_and_belongs_to_many :products
  
  def product_name
    name = ''
    self.products.each do |product, index|
      name = name + product.name
      if product != self.products.last
        name = name + '+'
      end
    end
    return name
  end
end
