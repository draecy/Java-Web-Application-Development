class BankAccount:
    def __init__(self, nameHold, accNum, accBal):
        self.nameHold = nameHold
        self.accNum = accNum
        self.accBal = int(accBal)

    def __add__(self):
        return BankAccount(balance + self.accBal)

    def __sub__(self):
        return BankAccount(balance + self.accBal)

    def __str__(self):
        return ("~~~ BANK STATEMENT ~~~\n"
                f"Account Holder Name: {self.nameHold}\n"
                f"Account Number: {self.accNum}\n"
                f"Transaction Type: {trans}\n"
                f"Transaction Amount: RM {amount}\n"
                f"Initial Balance: RM {self.accBal}\n"
                f"Status: {status}\n"
                "~~~~~~~~~~~~~~~~~~~~~~")

name = input("Enter holder name: ")
accNum = input("Enter account number: ")
type = int(input("Deposit(1) or Withdrawal(2)? "))
amount = int(input("Enter amount: RM "))
balance = int(input("Enter initial balance: RM "))
print()

if type == 1:
    trans = "Deposit"
    bal = BankAccount(name, accNum, balance)
    total = balance + amount
elif type == 2:
    trans = "Withdrawal"
    bal = BankAccount(name, accNum, balance)
    total = balance - amount
else:
    print("Wrong input.")

if balance >= 1000:
    status = "Premium"
elif balance >= 500:
    status = "Active"
elif balance >= 1:
    status = "Basic"
else:
    status = "Inactive"

name = BankAccount(name, accNum, total)
print(name)