class TestThis
  def initialize
    @transaction_history = [{date: "2014-12-01", credit: "100", debit: "", balance: "100"}, {date: "2014-12-01", credit: "", debit: "75", balance: "25"}].reverse

  end

  def create_columns_test
    @columns = { date: "Date", credit: "Credit", debit: "Debit", balance: "Balance" }.each_with_object({}) { |(col,label),h|
      h[col] = { label: label,
                 width: [@transaction_history.map { |g| g[col].size }.max, label.size].max } }
  end

  def write_header_test
    puts @columns.map { |_,g| g[:label].ljust(g[:width]) }.join(' || ').to_s
  end

  def write_line_test(h)
    str = h.keys.map { |k| h[k].ljust(@columns[k][:width]) }.join(" || ")
    puts str
  end

  def format_table_test
    create_columns_test
    write_header_test
    @transaction_history.each { |h| write_line_test(h) }
  end

end

# testthis = TestThis.new
# testthis.format_table_test

# account = Account.new
# account.deposit(10)
# account.deposit(100)
# account.withdraw(35)
# account.deposit(50000)
# account.withdraw(25000)
# account.format_table
