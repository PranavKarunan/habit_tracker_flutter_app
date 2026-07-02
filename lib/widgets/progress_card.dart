import 'package:flutter/material.dart';
import '../models/habit.dart';
import 'app_card.dart';

class ProgressCard extends StatelessWidget {
  final List<Habit> habits;

  const ProgressCard({super.key, required this.habits});

  @override
  Widget build(BuildContext context) {
    final total = habits.length;

    final completed = habits.where((h) => h.isCompleted).length;

    final progress = total == 0 ? 0.0 : completed / total;

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Today's Progress",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),

          const SizedBox(height: 20),

          LinearProgressIndicator(
            value: progress,
            minHeight: 10,
            borderRadius: BorderRadius.circular(20),
          ),

          const SizedBox(height: 16),

          Text("$completed of $total habits completed"),
        ],
      ),
    );
  }
}
