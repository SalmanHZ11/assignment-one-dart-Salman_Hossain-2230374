import 'dart:math';

void main() {
  // 1) Create a list of student names
  final students = <String>[
    'Alice',
    'Bob',
    'Charlie',
    'Diana',
    'Eve',
  ];

  // 2) Create a map to store scores for each student
  final Map<String, int> studentScores = {};

  // 3) Use Random to assign each student a score between 60 and 100
  final random = Random();
  for (final student in students) {
    // nextInt(41) gives 0–40 → plus 60 gives 60–100
    final score = 60 + random.nextInt(41);
    studentScores[student] = score;
  }

  // 4) Print all student scores
  print('Student scores:');
  studentScores.forEach((name, score) {
    print('$name: $score');
  });

  // 5) Find highest, lowest, and average
  String topStudent = '';
  int highestScore = -1;

  String lowestStudent = '';
  int lowestScore = 101;

  int totalScore = 0;

  studentScores.forEach((name, score) {
    // highest
    if (score > highestScore) {
      highestScore = score;
      topStudent = name;
    }

    // lowest
    if (score < lowestScore) {
      lowestScore = score;
      lowestStudent = name;
    }

    // sum for average
    totalScore += score;
  });

  final averageScore = totalScore / studentScores.length;

  print('Highest Score: $topStudent - $highestScore');
  print('Lowest Score: $lowestStudent - $lowestScore');
  print('Average Score: ${averageScore.toStringAsFixed(2)}');

  // 6) Categorize each student using a switch-based helper
  print('Student categories:');
  studentScores.forEach((name, score) {
    final category = categorizeScore(score);
    print('$name: $category');
  });
}

// Helper function to categorize score using switch
String categorizeScore(int score) {
  // Integer division groups scores by tens:
  // 95 ~/ 10 -> 9, 72 ~/ 10 -> 7, etc.
  switch (score ~/ 10) {
    case 10: // 100
    case 9:  // 90–99
      return 'Excellent';
    case 8:  // 80–89
      return 'Good';
    case 7:  // 70–79
      return 'Average';
    default: // 0–69
      return 'Needs Improvement';
  }
}

