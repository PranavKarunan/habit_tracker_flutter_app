import 'package:flutter/material.dart';
import 'screens/home/home_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/habit.dart';
import 'package:provider/provider.dart';
import './services/habit_services.dart';
import 'theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(HabitAdapter());

  await Hive.openBox<Habit>('habits');

  runApp(
    ChangeNotifierProvider(
      create: (_) => HabitService(),
      child: const HabitTrackerApp(),
    ),
  );
}

class HabitTrackerApp extends StatelessWidget {
  const HabitTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Habit Tracker',
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
    );
  }
}
