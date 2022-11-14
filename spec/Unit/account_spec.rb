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
  end
end