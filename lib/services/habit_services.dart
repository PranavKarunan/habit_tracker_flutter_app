import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../models/habit.dart';

class HabitService extends ChangeNotifier {
  final Box<Habit> _box = Hive.box<Habit>('habits');

  List<Habit> getHabits() {
    return _box.values.toList();
  }

  void addHabit(String name) {
    _box.add(Habit(name: name));
    notifyListeners();
  }

  void deleteHabit(int index) {
    _box.deleteAt(index);
    notifyListeners();
  }

  void updateHabit(int index, Habit habit) {
    _box.putAt(index, habit);
    notifyListeners();
  }

  void toggleHabit(int index) {
    final habit = _box.getAt(index);

    if (habit == null) return;

    habit.isCompleted = !habit.isCompleted;

    habit.save();

    notifyListeners();
  }
}
