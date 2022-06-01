require 'pry'

class CashRegister
  attr_accessor :discount, :total, :items, :last

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity = 1)
    self.total += price.to_f * quantity
    quantity.times {self.items << title}
    self.last = {title: title, price: price, quantity: quantity}
  end

  def apply_discount
    self.total = @total.to_f * (1.0 - (@discount.to_f / 100.0))
    @discount == 0 ? "There is no discount to apply." 
    : "After the discount, the total comes to $#{@total.to_i}."
  end

  def void_last_transaction
    self.items = self.last[:quantity].times {self.items.pop}
    
    self.total -= self.last[:price] * self.last[:quantity]
  end

end
