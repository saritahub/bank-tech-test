require 'date'
require 'timecop'
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
    elsif @withdrawal_amount > @balance.sum
      return "Insufficient funds, current balance is #{balance}. You can withdraw between 0.01 - #{balance}"
    else
      @balance << (-@withdrawal_amount)
    end
  end
  def balance
    return @balance.sum
  end

  def transaction_history
    # time = Time.new
    # time.strftime("%d/%m/%Y")
    # # return Date.today
    full_time = Timecop.freeze(Date.today)
    return full_time.to_s[0..9] #Returns current date in format "YYYY-MM-DD"
  end

end

