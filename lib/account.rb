class Account
  def initialize
    @balance = []
  end
  def deposit(deposit_amount)
    @deposit_amount = deposit_amount
    @balance << @deposit_amount
  end

  def withdraw(withdrawal_amount)
    @withdrawal_amount = withdrawal_amount
    @balance << (-@withdrawal_amount)
  end
  def balance
    return @balance.sum
  end

end