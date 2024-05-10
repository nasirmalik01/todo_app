import 'package:hive/hive.dart';

part 'todo.g.dart';

@HiveType(typeId: 1)
class Todo extends HiveObject {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  String? todoText;
  @HiveField(2)
  bool isCompleted;

  Todo({this.id, this.todoText, this.isCompleted = false});
  

}
