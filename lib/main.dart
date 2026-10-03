void main() {
  String appName = "Student Campus Companion";
  String studentName = "Vennela";
  int numberOfSubjects = 6;
  double attendancePercentage = 85.5;
  bool assignmentsCompleted = true;

  int completedAssignments = assignmentsCompleted ? 5 : 0;
  int studyHours = 3;

  print("Student Campus Companion");
  print("Student Name: $studentName");
  print("Number of Subjects: $numberOfSubjects");
  print("Attendance: $attendancePercentage%");
  print("Study Hours: $studyHours");
  print("Assignments Completed: $completedAssignments");
  print("All Assignments Done: $assignmentsCompleted");
  print("Welcome to $appName!");
}