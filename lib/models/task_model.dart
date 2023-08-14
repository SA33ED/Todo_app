class TaskModel {
  int? id;
  String title;
  String note;
  String date;
  String startTime;
  String endTime;
  String? status;
  int? color;
  TaskModel({
    this.id,
    required this.title,
    required this.note,
    required this.date,
    required this.startTime,
    required this.endTime,
    this.color = 1,
    this.status = "TODO",
  });
  factory TaskModel.fromJson(Map<String, dynamic> jsonData) {
    return TaskModel(
      id: jsonData['id'],
      title: jsonData['title'],
      note: jsonData['note'],
      date: jsonData['date'],
      startTime: jsonData['startTime'],
      endTime: jsonData['endTime'],
      color: jsonData['color'],
    );
  }
}
