# frozen_string_literal: true

require 'date'
# Documentation for the Class Account
class Account
  def initialize
    @balance = []
    @deposit_amount = 0
    @withdrawal_amount = 0
    @date_today = Date.today.to_s
    @transaction_history = []
  end

  def deposit(deposit_amount)
    raise 'Please enter a numerical value above 0.' if deposit_amount.class != Integer || deposit_amount == 0

    @deposit_amount = deposit_amount
    @balance << @deposit_amount

    @transaction_history << { date: @date_today, credit: @deposit_amount.to_s, debit: '', balance: balance.to_s }
    "You have deposited £#{@deposit_amount}, current balance: £#{balance}"
  end

  def withdraw(withdrawal_amount)
    raise 'Please enter a numerical value.' if withdrawal_amount.class != Integer

    @withdrawal_amount = withdrawal_amount

    if @balance.sum <= 0
      'Insufficient funds, current balance is 0.'
    elsif @withdrawal_amount > @balance.sum
      "Insufficient funds, current balance is #{balance}. You can withdraw between 0.01 - #{balance}"
    else
      @balance << (-@withdrawal_amount)
      @transaction_history << { date: @date_today, credit: '', debit: @withdrawal_amount.to_s, balance: balance.to_s }
      "You have withdrawn £#{@withdrawal_amount}, current balance: £#{balance}"
    end
  end

  def balance
    @balance.sum
  end

  def display_balance
    "Your current balance is £#{balance}"
  end

  def transaction_history
    if @deposit_amount.positive? || @withdrawal_amount.positive?
      @transaction_history
    else
      'No deposit or withdrawal'
    end
  end

  def create_columns
    @columns = { date: 'Date', credit: 'Credit', debit: 'Debit',
                 balance: 'Balance' }.each_with_object({}) do |(col, label), h|
      h[col] = { label: label,
                 width: [@transaction_history.map { |g| g[col].size }.max, label.size].max }
    end
  end

  def write_header
    puts @columns.map { |_, g| g[:label].ljust(g[:width]) }.join(' || ').to_s
  end

  def write_line(hash)
    str = hash.keys.map { |k| hash[k].ljust(@columns[k][:width]) }.join('|| ')
    puts str
  end

  def print_statement
    raise "Current balance is £#{balance}, there are no transactions to display" if @transaction_history.empty?
    create_columns
    write_header
    @transaction_history.each { |hash| write_line(hash) }
  end
end
