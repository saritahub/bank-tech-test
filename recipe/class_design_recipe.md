# Multi-Class Planned Design Recipe

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
┌────────────────────────────────────────┐                          ┌────────────────────────────────────────┐
│ Class Name                             │                          │ Class Name                             │
│                                        │                          │                                        │
│ Account                                │                          │ Transaction                            │
├────────────────────────────────────────┤                          ├────────────────────────────────────────┤
│                                        ├─────────────────────────►│                                        │
│  Methods                               │                          │  Methods                               │
│                                        │                          │                                        │
│  Deposit                               │                          │  Date                                  │
│  Withdraw                              │                          │  Deposit_amount                        │
│  Balance                               │                          │  Withdrawal_amount                     │
│  Transaction_history                   │                          │  Current_balance                       │
│  Print_statement                       │                          │                                        │
│                                        │                          │                                        │
└────────────────────────────────────────┘                          └────────────────────────────────────────┘
```

### Class responsibilities following the CRC model
```
┌────────────────────────────────────────┐                          ┌────────────────────────────────────────┐
│ Class Name                             │                          │ Class Name                             │
│                                        │                          │                                        │
│ Account                                │                          │ Transaction                            │
├────────────────────────────────────────┤                          ├────────────────────────────────────────┤
│                                        ├─────────────────────────►│                                        │
│  Responsibilities                      │                          │  Responsibilities                      │
│                                        │                          │                                        │
│  Places the deposit                    │                          │  Knows the date                        │
│  Places the withdrawal                 │                          │  Knows the deposit amount              │
│  Knows the current balance             │                          │  Knows the withdrawal amount           │   
│  Stores the transaction history        │                          │  Knows the balance after each          │
│  Can print the statement               │                          │  transaction                           │
│                                        │                          │                                        │
│                                        │                          │                                        │
│  Collaborator                          │                          │                                        │
│  Transaction                           │                          │                                        │
│                                        │                          │                                        │
└────────────────────────────────────────┘                          └────────────────────────────────────────┘ 

```


```ruby
class Account
  def initialize
    # ...
  end

  def deposit(amount) 
    # Adds the deposit amount to the balance
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
  end
  
  def transaction_history 
    # Returns a list of deposits and withdrawals (with date and current balance)
  end
end

class Track
  def initialize
  end

  def date
    # Stores the transaction dates
    # Or, just adds today's date 
  end

  def deposit
    # Stores the deposit transaction (along with date)
  end

  def withdrawal
    # Stores the withdrawal transaction (along with date)
  end

  def balance
    # Stores the balance after each transaction
    # Linked with the Account.balance 
  end
end
```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby
# EXAMPLE

# Gets all tracks
library = MusicLibrary.new
track_1 = Track.new("Carte Blanche", "Veracocha")
track_2 = Track.new("Synaesthesia", "The Thrillseekers")
library.add(track_1)
library.add(track_2)
library.all # => [track_1, track_2]
```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
# EXAMPLE

# Constructs a track
track = Track.new("Carte Blanche", "Veracocha")
track.title # => "Carte Blanche"
```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._