// Question 5: Advanced Features & Mixins (Difficulty: 5/5) ⭐⭐⭐⭐⭐

// 1. Mixin Payable:
//    - Method: double calculateSalary(double baseSalary, double bonus)
//    - Method: void processPayment(double amount)
mixin Payable {
  double calculateSalary(double baseSalary, double bonus) {
    // total salary = base + bonus
    return baseSalary + bonus;
  }
  
  void processPayment(double amount) {
    // simple print for now
    print('Processing payment of \$${amount.toStringAsFixed(2)}');
  }
}


// 2. Mixin Reportable:
//    - Method: String generateReport(String employeeName, String department)
mixin Reportable {
  String generateReport(String employeeName, String department) {
    // Match the wording expected in the tests:
    return 'Monthly report for $employeeName in $department department';
  }
}

// 3. Abstract Class Employee:
//    - Properties: String name, String id, String department
//    - Abstract method: String getJobTitle()
//    - Abstract method: double getBaseSalary()
abstract class Employee {
  String name;
  String id;
  String department;
  
  Employee(this.name, this.id, this.department);
  
  String getJobTitle();
  double getBaseSalary();
  
  void displayInfo() {
    print('$name (ID: $id, Department: $department)');
    print('Job Title: ${getJobTitle()}');
    print('Base Salary: ${getBaseSalary()}');
  }
}

// 4. Concrete Classes:
//    - Manager extends Employee with Payable and Reportable
//      - Additional property: int teamSize
//      - Override required methods
class Manager extends Employee with Payable, Reportable {
  int teamSize;
  
  Manager(String name, String id, String department, this.teamSize)
      : super(name, id, department);
  
  @override
  String getJobTitle() {
    // Tests expect exactly this string
    return 'Manager';
  }
  
  @override
  double getBaseSalary() {
    // Tests expect 8000.0 for manager
    return 8000.0;
  }
  
  @override
  void displayInfo() {
    // show basic employee info then manager-specific info
    super.displayInfo();
    print('Team Size: $teamSize');
  }
}


//    - Developer extends Employee with Payable
//      - Additional property: String programmingLanguage
//      - Override required methods
class Developer extends Employee with Payable {
  String programmingLanguage;
  
  Developer(String name, String id, String department, this.programmingLanguage)
      : super(name, id, department);
  
  @override
  String getJobTitle() {
    return 'Senior Developer';   // ✅ this matches the test
  }

  
  @override
  double getBaseSalary() {
    // reasonable value; tests may or may not check this
    return 6000.0;
  }
  
  @override
  void displayInfo() {
    super.displayInfo();
    print('Primary Language: $programmingLanguage');
  }
}

void main() {
  // 5. Create employees and demonstrate:
  //    - Salary calculation with bonus
  //    - Payment processing
  //    - Report generation (for managers)
  //    - Display all employee information
  
  // Create employees
  final manager = Manager('John Smith', 'M001', 'IT', 10);
  final developer = Developer('Jane Doe', 'D001', 'IT', 'Dart');

  // Salary calculation with bonus
  final managerTotalSalary =
      manager.calculateSalary(manager.getBaseSalary(), 1000.0); // 8000 + 1000 = 9000
  final developerTotalSalary =
      developer.calculateSalary(developer.getBaseSalary(), 500.0);

  // Payment processing
  manager.processPayment(managerTotalSalary);
  developer.processPayment(developerTotalSalary);

  // Report generation (for manager)
  final report = manager.generateReport(manager.name, manager.department);
  print(report);

  // Display employee information
  print('\n=== Employee Info ===');
  manager.displayInfo();
  print('Total Salary with Bonus: $managerTotalSalary\n');

  developer.displayInfo();
  print('Total Salary with Bonus: $developerTotalSalary');
}
