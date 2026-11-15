import 'package:flutter/material.dart';

void main() => runApp(const ProductsApp());

class ProductsApp extends StatelessWidget {
  const ProductsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Products')),
        backgroundColor: Colors.blue,
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              productCard(
                'Dart',
                'the best object language',
                'assets/ex3/dart.png',
              ),
              productCard(
                'Flutter',
                'the best mobile sdk library',
                'assets/ex3/flutter.png',
              ),
              productCard(
                'Firebase',
                'the best cloud database',
                'assets/ex3/firebase.png',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget productCard(String title, String description, String image) {
  return Card(
    color: Colors.white,
    child: Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(image, width: 60, height: 60),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(fontSize: 24)),
          const SizedBox(height: 4),
          Text(description, style: const TextStyle(fontSize: 10)),
        ],
      ),
    ),
  );
}


