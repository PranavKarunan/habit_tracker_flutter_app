import 'package:flutter/material.dart';
import '../../widgets/habit_tile.dart';
import '../add_habit/add_habit_screen.dart';
import '../../services/habit_services.dart';
import 'package:provider/provider.dart';
import '../../widgets/greeting_card.dart';
import '../../widgets/progress_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final habitService = Provider.of<HabitService>(context);
    final habits = habitService.getHabits();
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
              ProgressCard(habits: habits),

              const SizedBox(height: 20),

              const Text(
                "Today's Habits",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 16),

              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: habits.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(habits[index].name),

                    direction: DismissDirection.endToStart,

                    background: Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.only(right: 24),
                      alignment: Alignment.centerRight,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: const Icon(Icons.delete, color: Colors.white),
                    ),

                    confirmDismiss: (_) async {
                      return await showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text("Delete Habit"),
                          content: Text(
                            "Are you sure you want to delete '${habits[index].name}'?",
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context, false),
                              child: const Text("Cancel"),
                            ),
                            ElevatedButton(
                              onPressed: () => Navigator.pop(context, true),
                              child: const Text("Delete"),
                            ),
                          ],
                        ),
                      );
                    },

                    onDismissed: (_) {
                      habitService.deleteHabit(index);
                    },

                    child: HabitTile(
                      habit: habits[index],

                      onTap: () {
                        habitService.toggleHabit(index);
                      },

                      onEdit: () {},
                    ),
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
