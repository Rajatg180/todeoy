class Task{
  final String title;
  bool isDone;
  Task({
    required this.title,
    this.isDone=false,
  });
  void toggle(){
    isDone=!isDone;
  }

}