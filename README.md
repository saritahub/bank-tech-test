# Bank Tech Test

## Technologies and Design Principles:   
This project was built using Ruby. 
- To ensure readable and clean code, the SOLID principles were used throughout. 
- TDD approach, testing technology is RSpec. 


## To run this on your machine
`git clone https://github.com/saritahub/bank-tech-test.git`
`bundle install`

### To the banking program 
- Open your terminal and run: 
`cd lib`
`irb -r ./bank-tech-test.rb`

### To run the tests
- Ensure you are in the main'bank-tech-test' folder
- Open your terminal and run: 
`rspec`

# Project goals

## Task
- This is a command line app, where the user can make a deposit, withdrawal and view their bank statement. 

### Requirements

* You should be able to interact with your code via a REPL like IRB or Node.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2023  
**And** a deposit of 2000 on 13-01-2023  
**And** a withdrawal of 500 on 14-01-2023  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2023 || || 500.00 || 2500.00
13/01/2023 || 2000.00 || || 3000.00
10/01/2023 || 1000.00 || || 1000.00
```

## User stories
As a user
So that I can store my money in the bank
I’d like to be able to make a deposit (credit)

As a user
So that I can withdraw money from the bank 
I’d like to be able to make a withdrawal (debit) 

As a user
So that I know how much money I have
I’d like to be able to view my balance 

As a user
So that I can keep track of my deposits, withdrawals and balance
I’d like to be able to prints my bank statement with the transaction dates


