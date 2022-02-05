import 'dart:io';

void main() {
  performTasks();
}

performTasks() async {
  task1();
  String? task2Result = await task2();
  task3(task2Result);
}

task1() {
  print('task1 complete');
}

String? task2() {
  String? s;
  Duration d = Duration(seconds: 3);
  //sleep(d);
  Future.delayed(d, () {
    print('task2 complete');
  });
  return s;
}

task3(String task2Data) {
  print('task3 complete with $task2Data');
}
