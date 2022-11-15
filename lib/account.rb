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

    @transaction_history << %W[#{@date_today} Deposit #{@deposit_amount} #{balance}]
  end

  def withdraw(withdrawal_amount)
    @withdrawal_amount = withdrawal_amount

    if @balance.sum <= 0
      'Insufficient funds, current balance is 0.'
    elsif @withdrawal_amount > @balance.sum
      "Insufficient funds, current balance is #{balance}. You can withdraw between 0.01 - #{balance}"
    else
      @balance << (-@withdrawal_amount)
      @transaction_history << %W[#{@date_today} Withdrawal #{@withdrawal_amount} #{balance}]
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
    @transaction_history.join(", ")
  end

  def arr_to_hash
    fields = %i[date transaction amount balance]
    @transaction_history.map {|row| fields.zip(row).to_h }
  end

  # def create_columns
  #
  # end

end

# account = Account.new
# account.deposit(10)
# account.deposit(100)
# account.withdraw(35)
# account.transaction_history
# account.arr_to_hash
#
# data = [["15/11/22", "10", "10"], ["15/11/22", "5", "5"], ["15/11/22", "5", "0"]]
# fields = [:date, :transaction, :amount]
# output = data.map {|row| fields.zip(row).to_h }
#
# col_labels = { date: "Date", transaction: "Transaction", amount: "Amount" }
#
# arr = [{date: "2014-12-01", transaction: "Deposit", amount: "100"},
#        {date: "2014-12-01", transaction: "Deposit", amount: "122"},
#        {date: "2014-12-02", transaction: "Withdrawal", amount: "12"}]
# # private
# def create_colomns
# @columns = col_labels.each_with_object({}) { |(col,label),hash|
#   hash[col] = { label: label,
#              width: [data.map { |g| g[col].size }.max, label.size].max } }
# end
#
# private
# def write_header
#   puts "| #{ @columns.map { |_,g| g[:label].ljust(g[:width]) }.join(' || ') } |"
# end
# private
# def write_divider
#   puts "+-#{ @columns.map { |_,g| "-"*g[:width] }.join(" || ") }-+"
# end
# private
# def write_line(h)
#   str = h.keys.map { |k| h[k].ljust(@columns[k][:width]) }.join("  ||  ")
#   puts " #{str} "
# end
#
# write_divider
# write_header
# write_divider
# data.each { |h| write_line(h) }
# write_divider

# Move Date.today.to_s to the Transaction class - IDEAL!! [15/10/2022 Deposit: £10, 15/10/2022: Withdrawal: £10]
# Then amend tests (Integration)
# array_of_rows.map { |date,transaction,amount| { Date: n, Transaction: g, Amount: a } }
# [:Date, :Transaction, :Amount].zip(['date_placeholder', 'Deposit', '10', 'date_placeholder_2', 'Withdrawal', '5']).to_h
