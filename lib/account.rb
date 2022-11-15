require 'date'
class Account
  def initialize
    @balance = []
    @deposit_amount = 0
    @withdrawal_amount = 0
    @date_today = Date.today.to_s
    @transaction_history = []
  end
  def deposit(deposit_amount)
    @deposit_amount = deposit_amount
    @balance << @deposit_amount

    @transaction_history << "Date: #{@date_today} Deposit: #{@deposit_amount}"
  end

  def withdraw(withdrawal_amount)
    @withdrawal_amount = withdrawal_amount

    if @balance.sum <= 0
      'Insufficient funds, current balance is 0.'
    elsif @withdrawal_amount > @balance.sum
      "Insufficient funds, current balance is #{balance}. You can withdraw between 0.01 - #{balance}"
    else
      @balance << (-@withdrawal_amount)
      @transaction_history << "Date: #{@date_today} Withdrawal: #{@withdrawal_amount}"
    end
  end
  def balance
    return @balance.sum
  end

  def transaction_history
    if @deposit_amount > 0 || @withdrawal_amount > 0
      @transaction_history.join(" ")
    else
      'No deposit'
    end
  end

  # Move Date.today.to_s to the Transaction class - IDEAL!!
  # Then amend tests (Integration)

end

