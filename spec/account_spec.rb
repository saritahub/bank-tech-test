# frozen_string_literal: true

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

    context 'Deposit amount raises error' do
      it 'Raises an error message if the deposit input value is not an integer' do
        account = Account.new
        expect { account.deposit('50') }.to raise_error('Please enter a numerical value above 0.')
      end

      it 'Second test: Raises an error message if the deposit input value is not an integer' do
        account = Account.new
        expect { account.deposit('String') }.to raise_error('Please enter a numerical value above 0.')
      end

      it 'Third test: Raises an error message if the deposit input value is not an integer' do
        account = Account.new
        expect { account.deposit(['Array']) }.to raise_error('Please enter a numerical value above 0.')
      end
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
      account.withdraw(5)
      expect(account.balance).to eq(5)
    end

    context 'Withdrawal amount raises error' do
      it 'Raises an error message if the withdrawal input value is not an integer' do
        account = Account.new
        account.deposit(100)
        expect { account.withdraw('50') }.to raise_error('Please enter a numerical value.')
      end

      it 'Second test: Raises an error message if the withdrawal input value is not an integer' do
        account = Account.new
        account.deposit(100)
        expect { account.withdraw('String') }.to raise_error('Please enter a numerical value.')
      end

      it 'Third test: Raises an error message if the withdrawal input value is not an integer' do
        account = Account.new
        account.deposit(100)
        expect { account.withdraw(['Array']) }.to raise_error('Please enter a numerical value.')
      end
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

  context 'Print statement' do
    it 'Print statement returns formatted transaction history as a hash in reverse order' do
      account = Account.new
      account.deposit(100)
      account.withdraw(75)
      expect(account.print_statement).to eq([{ balance: '100', credit: '100', date: Date.today.to_s, debit: '' },
                                             { balance: '25', credit: '', date: Date.today.to_s, debit: '75' }])
    end

    it 'Second test: Print statement returns formatted transaction history as a hash in reverse order' do
      account = Account.new
      account.deposit(500)
      account.withdraw(20)
      expect(account.print_statement).to eq([{ balance: '500', credit: '500', date: Date.today.to_s, debit: '' },
                                             { balance: '480', credit: '', date: Date.today.to_s, debit: '20' }])
    end

    context "Raises error if there are no transactions" do
      it "Raises error if the user has not entered any deposit" do
        account = Account.new
        expect{account.print_statement}.to raise_error("Current balance is £0, there are no transactions to display")
      end

    end
  end
end
