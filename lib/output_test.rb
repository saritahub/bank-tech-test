col_labels = { date: "Date", transaction: "Transaction", amount: "Amount", balance: "Balance" }

arr = [{date: "2014-12-01", transaction: "Deposit", amount: "100", balance: "100"}, {date: "2014-12-01", transaction: "Withdrawal", amount: "50", balance: "50"}]

@columns = col_labels.each_with_object({}) { |(col,label),h|
  h[col] = { label: label,
             width: [arr.map { |g| g[col].size }.max, label.size].max } }


def write_header
  puts "#{ @columns.map { |_,g| g[:label].ljust(g[:width]) }.join(' || ') }"
end


def write_line(h)
  str = h.keys.map { |k| h[k].ljust(@columns[k][:width]) }.join(" || ")
  puts str
end


write_header
arr.each { |h| write_line(h) }


# date || credit || debit || balance
# 14/01/2023 || || 500.00 || 2500.00
# 13/01/2023 || 2000.00 || || 3000.00
# 10/01/2023 || 1000.00 || || 1000.00
