import 'package:flutter/material.dart';

void main() => runApp(const Task34App());

class Task34App extends StatelessWidget {
  const Task34App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: ColorScreen());
  }
}

class ColorScreen extends StatefulWidget {
  const ColorScreen({super.key});

  @override
  State<ColorScreen> createState() => _ColorScreenState();
}

class _ColorScreenState extends State<ColorScreen> {
  Color _color = Colors.grey;

  Future<void> _chooseColor() async {
    final picked = await Navigator.push<Color>(
      context,
      MaterialPageRoute(builder: (context) => const ColorPickerScreen()),
    );
    if (!mounted) return;
    if (picked != null) {
      setState(() {
        _color = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Current colour')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(width: 150, height: 150, color: _color),
            const SizedBox(height: 24),
            ElevatedButton(onPressed: _chooseColor, child: const Text('Choose colour')),
          ],
        ),
      ),
    );
  }
}

class ColorPickerScreen extends StatelessWidget {
  const ColorPickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pick a colour')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context, Colors.red),
              child: const Text('Red'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, Colors.green),
              child: const Text('Green'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, Colors.blue),
              child: const Text('Blue'),
            ),
          ],
        ),
      ),
    );
  }
}
