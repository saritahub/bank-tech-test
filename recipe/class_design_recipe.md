# Class Design Recipe

## 1. Describe the Problem
## User stories extracted from README
- [ ] 1<br />
  As a bank,<br />
  As we don't want to give away money,<br />
  Each user's account should start with a balance of zero

### Deposit
- [ ] 2<br />
  As a user,<br />
  So that I can store my money in the bank, <br />
  I’d like to be able to make a deposit (credit)

- [ ] 3<br />
  As a user,<br />
  So that I can keep track of how much money I deposit, <br />
  I want my statements to display the deposit amount

### Withdrawal
- [ ] 4<br />
  As a user,<br />
  So that I can withdraw money from the bank, <br />
  I’d like to be able to make a withdrawal (debit)

- [ ] 5 <br />
  As a user, <br />
  So I don't go into debt, <br />
  I only want the withdrawal to take place if I have sufficient funds

- [ ] 6 <br />
  As a user, <br />
  So I can keep on track of how much money I withdraw, <br />
  I want my statements to display the withdrawal amount

### Balance
- [ ] 7<br />
  As a user,<br />
  So that I know how much money I have,<br />
  I’d like to be able to view my balance

- [ ] 8<br />
  As a user,<br />
  So that I can keep track of my transactions,<br />
  I’d like to be able to view transaction dates

- [ ] 9<br />
  As a user,<br />
  So that I can keep track of my account balance,<br />
  I’d like to be able to view my balance after making a withdrawals and deposits

### Print statement
- [ ] 10<br />
  As a user,<br />
  So that I can keep track of my deposits, withdrawals and balance,<br />
  I’d like to be able to prints my bank statement with the transaction dates (recent date displayed first)


## 2. Design the Class System

### Class system with method names
```
┌────────────────────────────────────────┐                         
│ Class Name                             │                       
│                                        │                       
│ Account                                │                   
├────────────────────────────────────────┤                        
│                                        ├
│  Methods                               │                        
│                                        │                       
│  Deposit                               │                        
│  Withdraw                              │                         
│  Balance                               │                          
│  Transaction_history                   │                          
│  Print_statement                       │                          
│                                        │                        
└────────────────────────────────────────┘                         
```

### Class responsibilities following the CRC model
```
┌────────────────────────────────────────┐                          
│                                        │                          
│ Account                                │                          
├────────────────────────────────────────┤                         
│                                        ├
│  Responsibilities                      │                         
│                                        │                      
│  Places the deposit                    │                         
│  Places the withdrawal                 │                          
│  Knows the current balance             │                          
│  Stores the transaction history        │                         
│  Can print the statement               │                                                  
│                                        │                         
└────────────────────────────────────────┘                          

```


```ruby
class Account
  def initialize
    @balance = 0
    
    # ...
  end

  def deposit(amount) 
    # Adds the deposit amount to the balance
    # @balance + deposit(amount)
    # Returns message to user: Deposited {deposit_amount}, current balance: {current_balance}
  end

  def withdraw(amount)
    # Checks to see if the user has sufficient funds
    
    # If the user has sufficient funds: 
    # Subtracts the withdrawal amount from the balance
    # Returns message to user: Withdrawn {withdrawal_amount}, current balance: {current_balance}
    
    # If the user does not have sufficient funds, but the balance is above 0
    # Prompts the user to make a withdrawal between 0.01 - {current_balance}
    
    # If the user's balance is zero
    # Returns message to user: Insufficient funds, current balance is 0
  end

  def balance
    # Returns current balance
    # return @balance 
  end
  
  def transaction_history 
    # Returns a list of deposits and withdrawals (with date and current balance)
  end
  
  def print_statement
    #Prints the statement with transaction dates (recent date displayed first)
  end
  
end
```

## 4. Create Examples as Unit Tests
### Account unit tests
```ruby
# Returns the starting balance as zero (0)
account = Account.new
expect(account.balance).to eq(0)

# Adds £10 to the balance through one deposit
account = Account.new
account.deposit(10)
expect(account.balance).to eq(10)

# Adds £20 to the balance through two deposits
account = Account.new
account.deposit(10)
account.deposit(10)
expect(account.balance).to eq(20)

# Adds £50 to the balance through one deposit
account = Account.new
account.deposit(50)
expect(account.balance).to eq(50)

# Allows the user to withdraw £10 when the balance is £10
account = Account.new
account.deposit(10)
account.withdraw(10)
expect(account.balance).to eq(0)

# Allows the user to withdraw £5 when the balance is £10
account = Account.new
account.deposit(10)
account.withdraw(5) #May add withdrawal confirmation message with remaining balance: Withdrawn {withdrawal_amount}, current balance: {current_balance}
expect(account.balance).to eq(5)


# Checks to see if the user has sufficient funds
# If the user's balance is zero
# Returns message to user: Insufficient funds, current balance is 0
account = Account.new
expect(account.withdraw(5)).to eq("Insufficient funds, current balance is 0")

# Checks to see if the user has sufficient funds
# If the user does not have sufficient funds, but the balance is above 0
# Prompts the user to make a withdrawal between 0.01 - {current_balance}
account = Account.new
account.deposit(10)
expect(account.withdraw(50)).to eq("Insufficient funds, current balance is 10. You can withdraw between 0.01 - 10")

# Second test to check to see if the user has sufficient funds
# If the user does not have sufficient funds, but the balance is above 0
# Prompts the user to make a withdrawal between 0.01 - {current_balance}
account = Account.new
account.deposit(90)
expect(account.withdraw(100)).to eq("Insufficient funds, current balance is 90. You can withdraw between 0.01 - 90")

# Returns the transaction history (with dates)
account = Account.new
account.deposit(10) 
account.deposit(20)  
expect(account.transaction_history).to eq("Date: #{Date.today.to_s} Deposit: 10, Date: #{Date.today.to_s} Deposit: 20")

# Returns the transaction history for deposit and withdrawal
account = Account.new
account.deposit(10) 
account.withdraw(10) 
expect(account.transaction_history).to eq("15/10/2022 Deposit: £10, 15/10/2022: Withdrawal: £10")


# Returns the transaction history in the correct format 
account = Account.new
account.deposit(10)
account.withdraw(10)
expect(account.print_statement).to eq("15/10/2022 Deposit: £10, 15/10/2022: Withdrawal: £10")

```
