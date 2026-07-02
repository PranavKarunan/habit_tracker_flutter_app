import 'package:flutter/material.dart';
import '../models/habit.dart';

class HabitTile extends StatelessWidget {
  final Habit habit;
  final VoidCallback onTap;
  final VoidCallback onEdit;

  const HabitTile({
    super.key,
    required this.habit,
    required this.onTap,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          children: [
            Text(habit.emoji, style: const TextStyle(fontSize: 30)),

            const SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    habit.name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      decoration: habit.isCompleted
                          ? TextDecoration.lineThrough
                          : null,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    "${habit.frequency} • ${habit.category}",
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),

            IconButton(
              onPressed: onEdit,
              icon: const Icon(Icons.edit_outlined),
            ),

            Checkbox(value: habit.isCompleted, onChanged: (_) => onTap()),
          ],
        ),
      ),
    );
  }
}
