require 'account'
require 'date'
RSpec.describe 'Account' do
  context 'Balance method' do
    it 'Returns current balance as 0' do
      account = Account.new
      expect(account.balance).to eq(0)
    end
  end

  context 'Deposit method' do
    it 'Following a deposit of £10, returns the current balance as £10' do
      account = Account.new
      account.deposit(10)
      expect(account.balance).to eq(10)
    end

    it 'Adds £20 to the balance through two deposits' do
      account = Account.new
      account.deposit(10)
      account.deposit(10)
      expect(account.balance).to eq(20)
    end

    it 'Adds £50 to the balance through one deposit' do
      account = Account.new
      account.deposit(50)
      expect(account.balance).to eq(50)
    end
  end

  context 'Withdraw method with sufficient funds' do
    it 'Allows the user to withdraw £10 when the balance is £10' do
      account = Account.new
      account.deposit(10)
      account.withdraw(10)
      expect(account.balance).to eq(0)
    end

    it 'Allows the user to withdraw £5 when the balance is £10' do
      account = Account.new
      account.deposit(10)
      account.withdraw(5) #May add withdrawal confirmation message with remaining balance: Withdrawn {withdrawal_amount}, current balance: {current_balance}
      expect(account.balance).to eq(5)
    end
  end

  context 'Withdraw method with insufficient funds' do
    context 'Checks to see if the user has sufficient funds' do
      it "If the user's balance is zero, returns message to user: Insufficient funds, current balance is 0" do
        account = Account.new
        expect(account.withdraw(5)).to eq('Insufficient funds, current balance is 0.')
      end

      it 'If the user does not have sufficient funds, but the balance is above 0, prompts the user to make a withdrawal between 0.01 and current balance' do
        account = Account.new
        account.deposit(10)
        expect(account.withdraw(50)).to eq('Insufficient funds, current balance is 10. You can withdraw between 0.01 - 10')
      end

      it 'When the balance is 90 and the user tries to withdraw 100, it prompts to withdraw under 90' do
        account = Account.new
        account.deposit(90)
        expect(account.withdraw(100)).to eq('Insufficient funds, current balance is 90. You can withdraw between 0.01 - 90')
      end
    end
  end

  context 'Transaction history method' do
    context "Deposit with today's date" do
      it "Transaction history returns today's date with the deposit amount of 10" do
        account = Account.new
        account.deposit(10)
        expect(account.transaction_history).to eq([["#{Date.today}", "Deposit", "10", "10"]])
      end

      it "Transaction history returns today's date with the deposit amount of 20" do
        account = Account.new
        account.deposit(20)
        expect(account.transaction_history).to eq([["#{Date.today}", "Deposit", "20", "20"]])
      end

      it "Multiple deposits: Transaction history returns today's date with the deposit amounts of 10 and 20" do
        account = Account.new
        account.deposit(10)
        account.deposit(20)
        expect(account.transaction_history).to eq([["#{Date.today}", "Deposit", "10", "10"],
                                                   ["#{Date.today}", "Deposit","20", "30"]])
      end

      it "Three deposits: Transaction history returns today's date with the deposit amounts of 10 and 20" do
        account = Account.new
        account.deposit(10)
        account.deposit(20)
        account.deposit(1000)
        expect(account.transaction_history).to eq([["#{Date.today}", "Deposit", "10", "10"],
                                                   ["#{Date.today}", "Deposit", "20","30"], ["#{Date.today}", "Deposit", "1000","1030"]])
      end
    end

    context "Withdrawal with today's date" do
      it 'Returns the transaction history for deposit and withdrawal' do
        account = Account.new
        account.deposit(10)
        account.withdraw(10)
        expect(account.transaction_history).to eq([["#{Date.today}", "Deposit", "10", "10"],
                                                   ["#{Date.today}", "Withdrawal", "10", "0"]])
      end

      it 'Multiple withdrawals: Returns the transaction history for deposit and withdrawal' do
        account = Account.new
        account.deposit(10)
        account.withdraw(5)
        account.withdraw(5)
        expect(account.transaction_history).to eq( [["#{Date.today}", "Deposit", "10", "10"],
                                                    ["#{Date.today}", "Withdrawal", "5", "5"], ["#{Date.today}", "Withdrawal", "5", "0"]])
      end
    end

    it 'If there is no deposit or withdrawal, the user will see this message' do
      account = Account.new
      expect(account.transaction_history).to eq('No deposit or withdrawal')
    end
  end

  context 'Print statement' do
    it 'Print statement returns unformatted transaction history' do
      account = Account.new
      account.deposit(10)
      account.withdraw(10)
      expect(account.print_statement).to eq("#{Date.today}, Deposit, 10, 10, #{Date.today}, Withdrawal, 10, 0")
    end

    it "Print statement returns formatted transaction history" do
      account = Account.new
      account.deposit(10)
      account.withdraw(10)
      expect(account.print_statement).to eq("#{Date.today}, Deposit, 10, 10, #{Date.today}, Withdrawal, 10, 0")
    end
  end
end