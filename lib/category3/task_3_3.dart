import 'package:flutter/material.dart';

class Contact {
  final String name;
  final String phone;
  final String email;
  const Contact(this.name, this.phone, this.email);
}

const contacts = [
  Contact('Aziza Karimova', '+998 90 123 45 67', 'aziza@example.com'),
  Contact('Sardor Aliyev', '+998 91 234 56 78', 'sardor@example.com'),
  Contact('Nigora Tosheva', '+998 93 345 67 89', 'nigora@example.com'),
  Contact('Jasur Rahimov', '+998 94 456 78 90', 'jasur@example.com'),
  Contact('Dilnoza Yusupova', '+998 95 567 89 01', 'dilnoza@example.com'),
];

void main() => runApp(const Task33App());

class Task33App extends StatelessWidget {
  const Task33App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: ContactListScreen());
  }
}

class ContactListScreen extends StatelessWidget {
  const ContactListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contacts')),
      body: ListView(
        children: [
          for (final c in contacts)
            ListTile(
              leading: CircleAvatar(child: Text(c.name[0])),
              title: Text(c.name),
              subtitle: Text(c.phone),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ContactScreen(contact: c)),
              ),
            ),
        ],
      ),
    );
  }
}

class ContactScreen extends StatelessWidget {
  final Contact contact;

  const ContactScreen({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(contact.name)),
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(24),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(radius: 36, child: Text(contact.name[0], style: const TextStyle(fontSize: 28))),
                const SizedBox(height: 12),
                Text(contact.name, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                const Divider(height: 24),
                ListTile(leading: const Icon(Icons.phone), title: Text(contact.phone)),
                ListTile(leading: const Icon(Icons.email), title: Text(contact.email)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
