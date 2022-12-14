# frozen_string_literal: true

require 'date'
# Documentation for the Class Account
class Account
  def initialize
    @balance = []
    @deposit_amount = 0
    @withdraw_amount = 0
    @date_today = Date.today.to_s
    @transaction_history = []
  end

  def deposit(deposit_amount)
    raise 'Please enter a numerical value above 0.01.' if deposit_amount.class != Integer || deposit_amount.negative?

    @deposit_amount = deposit_amount
    @balance << @deposit_amount

    @transaction_history << { date: @date_today, credit: @deposit_amount.to_s, debit: '', balance: balance.to_s }
    "You have deposited £#{@deposit_amount}, current balance: £#{balance}"
  end

  def withdraw(withdraw_amount)
    if withdraw_amount.class != Integer || withdraw_amount.negative?
      raise "Please enter a numerical value above 0.01 and less than your current balance: £#{balance}."
    end

    @withdraw_amount = withdraw_amount

    withdraw_conditions
  end

  def balance
    @balance.sum
  end

  def display_balance
    "Your current balance is £#{balance}"
  end

  def print_statement
    raise "Current balance is £#{balance}, there are no transactions to display" if @transaction_history.empty?

    create_columns
    write_header
    @transaction_history.reverse.each { |hash| write_line(hash) }
  end

  private

  def withdraw_conditions
    if @balance.sum <= 0
      'Insufficient funds, current balance is £0.'
    elsif @withdraw_amount > @balance.sum
      "Insufficient funds, current balance is £#{balance}. You can withdraw between £0.01 - £#{balance}"
    else
      @balance << (-@withdraw_amount)
      @transaction_history << { date: @date_today, credit: '', debit: @withdraw_amount.to_s, balance: balance.to_s }
      "You have withdrawn £#{@withdraw_amount}, current balance: £#{balance}"
    end
  end

  def create_columns
    @columns = { date: 'Date', credit: 'Credit', debit: 'Debit',
                 balance: 'Balance' }.each_with_object({}) do |(col, label), hash|
      hash[col] = { label: label,
                    width: [@transaction_history.map { |g| g[col].size }.max, label.size].max }
    end
  end

  def write_header
    puts @columns.map { |_, g| g[:label].ljust(g[:width]) }.join(' || ').to_s
  end

  def write_line(hash)
    str = hash.keys.map { |key| hash[key].ljust(@columns[key][:width]) }.join('|| ')
    puts str
  end
end
