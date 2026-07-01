import 'package:flutter/material.dart';
import '../../widgets/habit_tile.dart';
import '../add_habit/add_habit_screen.dart';
import '../../services/habit_services.dart';
import 'package:provider/provider.dart';
import '../../widgets/greeting_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final habitService = Provider.of<HabitService>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final result = await Navigator.push<String>(
            context,
            MaterialPageRoute(builder: (_) => const AddHabitScreen()),
          );

          if (result != null && result.trim().isNotEmpty) {
            habitService.addHabit(result);
          }
        },
        icon: const Icon(Icons.add),
        label: const Text("Add Habit"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const GreetingCard(),

              const SizedBox(height: 24),

              const Text(
                "Today's Habits",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 16),

              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: habitService.getHabits().length,
                itemBuilder: (context, index) {
                  return HabitTile(
                    habit: habitService.getHabits()[index],
                    onTap: () {
                      habitService.toggleHabit(index);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
