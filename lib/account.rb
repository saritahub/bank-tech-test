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

    @transaction_history << {date: @date_today.to_s, credit: @deposit_amount.to_s, debit: '', balance: balance.to_s}
  end

  def withdraw(withdrawal_amount)
    @withdrawal_amount = withdrawal_amount

    if @balance.sum <= 0
      'Insufficient funds, current balance is 0.'
    elsif @withdrawal_amount > @balance.sum
      "Insufficient funds, current balance is #{balance}. You can withdraw between 0.01 - #{balance}"
    else
      @balance << (-@withdrawal_amount)
      @transaction_history << {date: @date_today.to_s, credit: '', debit: @withdrawal_amount.to_s, balance: balance.to_s}
    end
  end

  def balance
    @balance.sum
  end

  def transaction_history
    if @deposit_amount.positive? || @withdrawal_amount.positive?
      @transaction_history
    else
      'No deposit or withdrawal'
    end
  end

  def print_statement
    @transaction_history.join(', ')
  end

  def create_columns
    col_labels = { date: 'Date', credit: 'Credit', debit: 'Debit', balance: 'Balance' }

    @columns = col_labels.each_with_object({}) { |(col,label),h|
      h[col] = { label: label,
                 width: [@transaction_history.map { |g| g[col].size }.max, label.size].max } }
  end

  def write_header
    puts "#{ @columns.map { |_,g| g[:label].ljust(g[:width]) }.join(' || ') }"
  end

  def write_line(h)
    str = h.keys.map { |k| h[k].ljust(@columns[k][:width]) }.join(" || ")
    puts str
  end

  def format_table
    create_columns
    write_header
    @transaction_history.each { |h| write_line(h) }
  end
end

