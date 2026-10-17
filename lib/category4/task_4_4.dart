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

void main() => runApp(const Task44App());

class Task44App extends StatelessWidget {
  const Task44App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRoutes.home,
      onGenerateRoute: (settings) {
        if (settings.name == AppRoutes.home) {
          return MaterialPageRoute(builder: (context) => const UserListScreen());
        }
        if (settings.name == AppRoutes.profile) {
          if (settings.arguments is User) {
            final user = settings.arguments as User;
            return MaterialPageRoute(builder: (context) => ProfileScreen(user: user));
          }
        }
        return null;
      },
    );
  }
}

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Users (onGenerateRoute)')),
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
  final User user;

  const ProfileScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
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
