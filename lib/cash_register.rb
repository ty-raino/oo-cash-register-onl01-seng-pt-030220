class CashRegister
  attr_accessor :discount, :purchases, :total, :transaction

  def initialize(discount=nil)
    self.total = 0
    self.discount = discount if discount != nil
    self.purchases = []
  end

  def add_item(name, price, quantity=1)
    self.transaction = [name, price, quantity]
    quantity.times do
      self.purchases.push self.transaction[0]
      self.total += self.transaction[1]
    end
  end

  def apply_discount
    if discount
      self.total = self.total - self.total*self.discount/100
      result = "After the discount, the total comes to $#{self.total}."
    else
      result = "There is no discount to apply."
    end
    return result
  end

  def items
    return self.purchases
  end

  def void_last_transaction
    quantity = self.transaction[2]
    quantity.times do
      self.purchases.pop
      self.total -= self.transaction[1]
    end
  end
end
