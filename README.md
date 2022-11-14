# Bank Tech Test

## Technologies and Design Principles:   
This project was built using Ruby. 
- To ensure readable and clean code, the SOLID principles were used throughout. 
- TDD approach.
- Testing technology is RSpec. 


### To run this on your machine
`git clone https://github.com/saritahub/bank-tech-test.git` <br />
`bundle install`

### To open the banking program 
- Open your terminal and run: <br />
`cd lib` <br />
`irb -r ./bank-tech-test.rb`

### To run the tests
- Ensure you are in the main 'bank-tech-test' folder
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


