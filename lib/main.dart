import 'package:demo_object_box/objectbox.dart';
import 'package:demo_object_box/task_elements.dart';
import 'package:demo_object_box/tasklist_elements.dart';
import 'package:flutter/material.dart';

late ObjectBox objectbox;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  objectbox = await ObjectBox.create();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0F2FB),
      appBar: AppBar(title: Text(widget.title)),
      body: const Column(
        children: [
          SizedBox(
            height: 10,
          ),
          SwipeLeftNotification(),
          TaskList()
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        key: const Key('add'),
        label: const Text('Add Task'),
        heroTag: null,
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const TaskInput()));
        },
      ),
    );
  }
}
