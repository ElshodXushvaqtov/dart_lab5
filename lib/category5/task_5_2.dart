import 'package:flutter/material.dart';

void main() => runApp(const Task52App());

class Task52App extends StatelessWidget {
  const Task52App({super.key});

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
        child: ElevatedButton(
          child: const Text('Open with slide'),
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 400),
                pageBuilder: (context, animation, secondaryAnimation) => const DetailsScreen(),
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
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details')),
      body: const Center(child: Text('I slid in from the right!')),
    );
  }
}
