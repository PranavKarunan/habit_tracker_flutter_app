import 'package:hive/hive.dart';

part 'habit.g.dart';

@HiveType(typeId: 0)
class Habit extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  bool isCompleted;

  @HiveField(2)
  String emoji;

  @HiveField(3)
  String category;

  @HiveField(4)
  String frequency;

  @HiveField(5)
  String reminderTime;

  Habit({
    required this.name,
    this.isCompleted = false,
    this.emoji = "✅",
    this.category = "Personal",
    this.frequency = "Daily",
    this.reminderTime = "",
  });
}
