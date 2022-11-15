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

    @transaction_history << ["Date: #{@date_today} Deposit: #{@deposit_amount}"]
  end

  def withdraw(withdrawal_amount)
    @withdrawal_amount = withdrawal_amount

    if @balance.sum <= 0
      'Insufficient funds, current balance is 0.'
    elsif @withdrawal_amount > @balance.sum
      "Insufficient funds, current balance is #{balance}. You can withdraw between 0.01 - #{balance}"
    else
      @balance << (-@withdrawal_amount)
      @transaction_history << ["Date: #{@date_today} Withdrawal: #{@withdrawal_amount}"]
    end
  end

  def balance
    @balance.sum
  end

  def transaction_history
    if @deposit_amount.positive? || @withdrawal_amount.positive?
      @transaction_history #.join(" ")
    else
      'No deposit or withdrawal'
    end
  end

  def print_statement
    @transaction_history.join(" ")
  end

  # Move Date.today.to_s to the Transaction class - IDEAL!! [15/10/2022 Deposit: £10, 15/10/2022: Withdrawal: £10]
  # Then amend tests (Integration)
  # "Date: date_placeholder Withdrawal: 5 Date: date_placeholder Withdrawal: 5"
  # array_of_rows.map { |date,transaction,amount| { Date: n, Transaction: g, Amount: a } }
  # [:Date, :Transaction, :Amount].zip(['date_placeholder', 'Deposit', '10', 'date_placeholder_2', 'Withdrawal', '5']).to_h

end

# account = Account.new
# account.deposit(10)
# account.transaction_history
