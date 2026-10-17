import 'package:flutter/material.dart';

void main() => runApp(const Task13App());

class Task13App extends StatelessWidget {
  const Task13App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: LoginScreen());
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: ElevatedButton(
          child: const Text('Sign in'),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          },
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: const Center(child: Text('Welcome! You are signed in.')),
    );
  }
}
