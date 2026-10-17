import 'package:flutter/material.dart';

void main() => runApp(const Task54App());

class Task54App extends StatelessWidget {
  const Task54App({super.key});

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
          child: const Text('Open with scale + fade'),
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 400),
                pageBuilder: (context, animation, secondaryAnimation) => const DetailsScreen(),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  final scale = Tween<double>(begin: 0.8, end: 1.0).animate(
                    CurvedAnimation(parent: animation, curve: Curves.easeInOut),
                  );
                  return FadeTransition(
                    opacity: animation,
                    child: ScaleTransition(scale: scale, child: child),
                  );
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
      body: const Center(child: Text('I grew and faded in!')),
    );
  }
}
