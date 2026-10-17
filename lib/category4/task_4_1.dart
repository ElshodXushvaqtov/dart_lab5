import 'package:flutter/material.dart';

class ScreenArguments {
  final String title;
  final String message;
  const ScreenArguments(this.title, this.message);
}

void main() => runApp(const Task41App());

class Task41App extends StatelessWidget {
  const Task41App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/details': (context) => const DetailsScreen(),
      },
    );
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
          child: const Text('Send arguments'),
          onPressed: () {
            Navigator.pushNamed(
              context,
              '/details',
              arguments: const ScreenArguments('Welcome', 'Sent from Home'),
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
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    return Scaffold(
      appBar: AppBar(title: Text(args.title)),
      body: Center(child: Text(args.message)),
    );
  }
}
