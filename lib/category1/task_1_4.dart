import 'package:flutter/material.dart';

void main() => runApp(const Task14App());

class Task14App extends StatelessWidget {
  const Task14App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: StepScreen(step: 1));
  }
}

class StepScreen extends StatelessWidget {
  final int step;
  static const lastStep = 4;

  const StepScreen({super.key, required this.step});

  @override
  Widget build(BuildContext context) {
    final isLast = step == lastStep;
    return Scaffold(
      appBar: AppBar(title: Text('Step $step')),
      body: Center(
        child: ElevatedButton(
          child: Text(isLast ? 'Finish' : 'Next'),
          onPressed: () {
            if (isLast) {
              Navigator.popUntil(context, (route) => route.isFirst);
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StepScreen(step: step + 1)),
              );
            }
          },
        ),
      ),
    );
  }
}
