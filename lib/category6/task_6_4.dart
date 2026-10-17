import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: 'settings',
          name: 'settings',
          builder: (context, state) => const SettingsScreen(),
        ),
        GoRoute(
          path: 'item/:id',
          name: 'item',
          builder: (context, state) => ItemScreen(id: state.pathParameters['id']!),
        ),
      ],
    ),
  ],
  errorBuilder: (context, state) => NotFoundScreen(location: state.uri.toString()),
);

void main() => runApp(const Task64App());

class Task64App extends StatelessWidget {
  const Task64App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: router);
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
              onPressed: () => context.goNamed('settings'),
              child: const Text('Settings'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => context.goNamed('item', pathParameters: {'id': '42'}),
              child: const Text('Item 42'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => context.go('/no-such-page'),
              child: const Text('Broken link'),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: const Center(child: Text('Settings')),
    );
  }
}

class ItemScreen extends StatelessWidget {
  final String id;

  const ItemScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Item $id')),
      body: Center(child: Text('Item #$id', style: const TextStyle(fontSize: 32))),
    );
  }
}

class NotFoundScreen extends StatelessWidget {
  final String location;

  const NotFoundScreen({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page not found')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.search_off, size: 64),
            const SizedBox(height: 12),
            Text('Nothing at "$location"'),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => context.goNamed('home'),
              child: const Text('Go home'),
            ),
          ],
        ),
      ),
    );
  }
}
