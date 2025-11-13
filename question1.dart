double calculateBMI(double weightKg, double heightMeters) {
  if (heightMeters <= 0) {
    return 0.0;
  }
  final bmi = weightKg / (heightMeters * heightMeters);
  return double.parse(bmi.toStringAsFixed(1));
}

String getGrade(int score) {
  if (score >= 90) {
    return 'A';
  } else if (score >= 80) {
    return 'B';
  } else if (score >= 70) {
    return 'C';
  } else if (score >= 60) {
    return 'D';
  } else {
    return 'F';
  }
}

void main() {
  final bmi = calculateBMI(120, 1.61);
  print('BMI: $bmi');

  final grade = getGrade(95);
  print('Grade: $grade');
}
