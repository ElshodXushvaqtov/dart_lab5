import 'package:flutter/material.dart';

class AppRoutes {
  static const home = '/';
  static const profile = '/profile';
  static const messages = '/messages';
  static const about = '/about';
}

void main() => runApp(const Task24App());

class Task24App extends StatelessWidget {
  const Task24App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.home: (context) => const SectionScreen(title: 'Home'),
        AppRoutes.profile: (context) => const SectionScreen(title: 'Profile'),
        AppRoutes.messages: (context) => const SectionScreen(title: 'Messages'),
        AppRoutes.about: (context) => const SectionScreen(title: 'About'),
      },
    );
  }
}

class SectionScreen extends StatelessWidget {
  final String title;

  const SectionScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      drawer: const AppDrawer(),
      body: Center(child: Text('$title section', style: const TextStyle(fontSize: 22))),
    );
  }
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  void _open(BuildContext context, String route) {
    Navigator.pop(context);
    Navigator.pushReplacementNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(child: Text('Menu', style: TextStyle(fontSize: 24))),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () => _open(context, AppRoutes.home),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () => _open(context, AppRoutes.profile),
          ),
          ListTile(
            leading: const Icon(Icons.message),
            title: const Text('Messages'),
            onTap: () => _open(context, AppRoutes.messages),
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About'),
            onTap: () => _open(context, AppRoutes.about),
          ),
        ],
      ),
    );
  }
}
