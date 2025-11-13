// question3.dart

class BankAccount {
  // Public fields (the test accesses these directly)
  String accountNumber;
  String accountHolder;
  String accountType;

  // Private balance field (we keep it internal and expose it via getters)
  double _balance;

  // Constructor: sets up the account with 0.0 starting balance
  BankAccount(this.accountNumber, this.accountHolder, this.accountType)
      : _balance = 0.0;

  // Getter so tests can read `account.balance`
  double get balance => _balance;

  // Method so tests can call `getBalance()`
  double getBalance() {
    return _balance;
  }

  // Deposit money into the account
  void deposit(double amount) {
    // Only allow positive amounts
    if (amount > 0) {
      _balance += amount;
    }
  }

  // Withdraw money from the account
  void withdraw(double amount) {
    // Only allow withdraw if amount is positive AND we have enough balance
    if (amount > 0 && amount <= _balance) {
      _balance -= amount;
    }
    // If not enough balance, do nothing (balance stays the same)
  }
}

void main() {
  // Simple demo (not used by tests, but good for you to see)
  var account = BankAccount("12345", "Alice", "Savings");
  print("Account created for ${account.accountHolder}");
  account.deposit(100.0);
  print("Balance after deposit: ${account.getBalance()}");
  account.withdraw(50.0);
  print("Balance after withdrawal: ${account.getBalance()}");
}
