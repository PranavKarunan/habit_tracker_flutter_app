import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class GreetingCard extends StatelessWidget {
  const GreetingCard({super.key});

  String greeting() {
    final hour = DateTime.now().hour;

    if (hour < 12) return "Good Morning ☀️";

    if (hour < 17) return "Good Afternoon 🌤";

    return "Good Evening 🌙";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.all(24),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),

        gradient: const LinearGradient(
          colors: [Color(0xff6366F1), Color(0xff8B5CF6)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 28,
                backgroundColor: Colors.white24,
                child: Icon(Icons.person, color: Colors.white),
              ),

              const SizedBox(width: 16),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      greeting(),
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 15,
                      ),
                    ),

                    const SizedBox(height: 4),

                    const Text(
                      "Pranav",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 30),

          Text(
            "Let's build great habits today 💪",
            style: TextStyle(color: Colors.white.withOpacity(.9), fontSize: 18),
          ),
        ],
      ),
    );
  }
}
