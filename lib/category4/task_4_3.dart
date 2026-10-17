import 'package:flutter/material.dart';

class User {
  final String name;
  final int age;
  final String city;
  const User(this.name, this.age, this.city);
}

const users = [
  User('Aziza', 21, 'Tashkent'),
  User('Sardor', 23, 'Samarkand'),
  User('Nigora', 20, 'Bukhara'),
  User('Jasur', 22, 'Namangan'),
];

class AppRoutes {
  static const home = '/';
  static const profile = '/profile';
}

void main() => runApp(const Task43App());

class Task43App extends StatelessWidget {
  const Task43App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.home: (context) => const UserListScreen(),
        AppRoutes.profile: (context) => const ProfileScreen(),
      },
    );
  }
}

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Users')),
      body: ListView(
        children: [
          for (final u in users)
            ListTile(
              leading: const Icon(Icons.person),
              title: Text(u.name),
              onTap: () => Navigator.pushNamed(context, AppRoutes.profile, arguments: u),
            ),
        ],
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)!.settings.arguments as User;
    return Scaffold(
      appBar: AppBar(title: Text(user.name)),
      body: ListView(
        children: [
          ListTile(title: const Text('Name'), subtitle: Text(user.name)),
          ListTile(title: const Text('Age'), subtitle: Text('${user.age}')),
          ListTile(title: const Text('City'), subtitle: Text(user.city)),
        ],
      ),
    );
  }
}
