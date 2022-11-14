require 'account'
RSpec.describe "Account" do
  context "Balance method" do
    it "Returns current balance as 0" do
      account = Account.new
      expect(account.balance).to eq(0)
    end
  end
end