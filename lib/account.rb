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


    if @balance.sum <= 0
      return "Insufficient funds, current balance is 0."
    else
      @balance << (-@withdrawal_amount)
    end
  end
  def balance
    return @balance.sum
  end

end