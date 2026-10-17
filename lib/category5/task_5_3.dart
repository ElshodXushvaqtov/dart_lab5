import 'package:flutter/material.dart';

void main() => runApp(const Task53App());

class Task53App extends StatelessWidget {
  const Task53App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              child: const Text('Open with slide'),
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 400),
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const DetailsScreen(text: 'From the right'),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      final position = Tween<Offset>(
                        begin: const Offset(1, 0),
                        end: Offset.zero,
                      ).animate(animation);
                      return SlideTransition(position: position, child: child);
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              child: const Text('Open as a sheet'),
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 500),
                    reverseTransitionDuration: const Duration(milliseconds: 500),
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const DetailsScreen(text: 'From the bottom'),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      final curved = CurvedAnimation(parent: animation, curve: Curves.easeOut);
                      final position = Tween<Offset>(
                        begin: const Offset(0, 1),
                        end: Offset.zero,
                      ).animate(curved);
                      return SlideTransition(position: position, child: child);
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  final String text;

  const DetailsScreen({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details')),
      body: Center(child: Text(text, style: const TextStyle(fontSize: 22))),
    );
  }
}
