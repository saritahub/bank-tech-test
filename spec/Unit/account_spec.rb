require 'account'
RSpec.describe "Account" do
  context "Balance method" do
    it "Returns current balance as 0" do
      account = Account.new
      expect(account.balance).to eq(0)
    end
  end

  context "Deposit method" do
    it "Following a deposit of £10, returns the current balance as £10" do
      account = Account.new
      account.deposit(10)
      expect(account.balance).to eq(10)
    end

    it "Adds £20 to the balance through two deposits" do
      account = Account.new
      account.deposit(10)
      account.deposit(10)
      expect(account.balance).to eq(20)
    end

    it "Adds £50 to the balance through one deposit" do
      account = Account.new
      account.deposit(50)
      expect(account.balance).to eq(50)
    end
  end

  context "Withdraw method" do
    it "Allows the user to withdraw £10 when the balance is £10" do
      account = Account.new
      account.deposit(10)
      account.withdraw(10)
      expect(account.balance).to eq(0)
    end

    it "Allows the user to withdraw £5 when the balance is £10" do
      account = Account.new
      account.deposit(10)
      account.withdraw(5) #May add withdrawal confirmation message with remaining balance: Withdrawn {withdrawal_amount}, current balance: {current_balance}
      expect(account.balance).to eq(5)
    end
  end
end