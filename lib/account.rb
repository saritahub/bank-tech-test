class Account
  def initialize
    @balance = []
  end
  def deposit(amount)
    @amount = amount
    @balance << @amount
  end
  def balance
    return @balance.sum
  end

end