import 'package:flutter/material.dart';

import 'category1/task_1_1.dart' show Task11App;
import 'category1/task_1_2.dart' show Task12App;
import 'category1/task_1_3.dart' show Task13App;
import 'category1/task_1_4.dart' show Task14App;
import 'category2/task_2_1.dart' show Task21App;
import 'category2/task_2_2.dart' show Task22App;
import 'category2/task_2_3.dart' show Task23App;
import 'category2/task_2_4.dart' show Task24App;
import 'category3/task_3_1.dart' show Task31App;
import 'category3/task_3_2.dart' show Task32App;
import 'category3/task_3_3.dart' show Task33App;
import 'category3/task_3_4.dart' show Task34App;
import 'category4/task_4_1.dart' show Task41App;
import 'category4/task_4_2.dart' show Task42App;
import 'category4/task_4_3.dart' show Task43App;
import 'category4/task_4_4.dart' show Task44App;
import 'category5/task_5_1.dart' show Task51App;
import 'category5/task_5_2.dart' show Task52App;
import 'category5/task_5_3.dart' show Task53App;
import 'category5/task_5_4.dart' show Task54App;
import 'category6/task_6_1.dart' show Task61App;
import 'category6/task_6_2.dart' show Task62App;
import 'category6/task_6_3.dart' show Task63App;
import 'category6/task_6_4.dart' show Task64App;

class LabTask {
  final String number;
  final String title;
  final Widget app;

  const LabTask(this.number, this.title, this.app);
}

const List<LabTask> tasks = [
  LabTask('1.1', 'Two screens with push and pop', Task11App()),
  LabTask('1.2', 'Three-screen chain', Task12App()),
  LabTask('1.3', 'Replace, do not stack', Task13App()),
  LabTask('1.4', 'Back to the start', Task14App()),
  LabTask('2.1', 'Route table and pushNamed', Task21App()),
  LabTask('2.2', 'Menu with four routes', Task22App()),
  LabTask('2.3', 'Page not found', Task23App()),
  LabTask('2.4', 'Drawer navigation', Task24App()),
  LabTask('3.1', 'Product list to product details', Task31App()),
  LabTask('3.2', 'Greeting', Task32App()),
  LabTask('3.3', 'Contact card', Task33App()),
  LabTask('3.4', 'Pick a colour (result back)', Task34App()),
  LabTask('4.1', 'ScreenArguments class', Task41App()),
  LabTask('4.2', 'Send a number', Task42App()),
  LabTask('4.3', 'User profile', Task43App()),
  LabTask('4.4', 'onGenerateRoute', Task44App()),
  LabTask('5.1', 'Fade transition', Task51App()),
  LabTask('5.2', 'Slide from the right', Task52App()),
  LabTask('5.3', 'Slide from the bottom', Task53App()),
  LabTask('5.4', 'Scale and fade together', Task54App()),
  LabTask('6.1', 'First router: go, push and pop', Task61App()),
  LabTask('6.2', 'Path parameters', Task62App()),
  LabTask('6.3', 'Passing an object with extra', Task63App()),
  LabTask('6.4', 'Named routes and 404 page', Task64App()),
];

void main() => runApp(const LabMenuApp());

class LabMenuApp extends StatelessWidget {
  const LabMenuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 5',
      theme: ThemeData(colorSchemeSeed: Colors.indigo),
      home: const MenuScreen(),
    );
  }
}

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lab 5 – Navigation')),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return ListTile(
            leading: CircleAvatar(child: Text(task.number, style: const TextStyle(fontSize: 12))),
            title: Text(task.title),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TaskRunner(task: task)),
              );
            },
          );
        },
      ),
    );
  }
}

class TaskRunner extends StatelessWidget {
  final LabTask task;

  const TaskRunner({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        task.app,
        Positioned(
          left: 16,
          bottom: 16,
          child: SafeArea(
            child: FloatingActionButton.extended(
              heroTag: null,
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.menu),
              label: Text('Menu (${task.number})'),
            ),
          ),
        ),
      ],
    );
  }
}
