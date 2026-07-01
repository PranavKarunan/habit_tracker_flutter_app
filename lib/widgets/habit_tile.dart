import 'package:flutter/material.dart';
import '../models/habit.dart';

class HabitTile extends StatelessWidget {
  final Habit habit;
  final VoidCallback onTap;

  const HabitTile({super.key, required this.habit, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: CheckboxListTile(
        value: habit.completed,
        onChanged: (_) => onTap(),
        title: Text(habit.name),
      ),
    );
  }
}
