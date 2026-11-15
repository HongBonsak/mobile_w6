import 'package:flutter/material.dart';

void main() => runApp(const HobbiesApp());

class HobbiesApp extends StatelessWidget {
  const HobbiesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('My Hobbies')),
        backgroundColor: Colors.grey,
        body: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            children: [
              hobbyBox(
                'Travelling',
                Icons.travel_explore,
                Colors.green,
              ),
              const SizedBox(height: 10),
              hobbyBox(
                'Skating',
                Icons.skateboarding,
                Colors.blueGrey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget hobbyBox(String name, IconData icon, Color color) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(vertical: 20),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Row(
      children: [
        const SizedBox(width: 30),
        Icon(icon, color: Colors.white),
        const SizedBox(width: 20),
        Text(
          name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ],
    ),
  );
}
