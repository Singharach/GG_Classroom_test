import 'package:flutter/material.dart';
import 'mockup/data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Google Classroom'),
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
  int _counter = 0;
  List<dynamic> courses = [];

  void _incrementCounter() {
    setState(() {
      _counter++;
      courses.add(randomCourse());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        elevation: 0,
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.0),
            child: Container(
              height: 1.0,
              color: Colors.grey[350],
            )),
        title: Text(widget.title),
      ),
      drawer: Sidebar(),
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (BuildContext ctx, int i) {
          dynamic checker = courses[i];
          String subjectCode = checker[0].toString();
          String className = checker[1];
          String teacher = checker[2].toString();
          String backgroundImage = checker[3];
          return ClassroomContext(
              classroomName: subjectCode + " " + className,
              teacherName: teacher,
              backgroundImage: AssetImage(backgroundImage));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          ListTile(
            title: const Text('Google Classroom'),
            onTap: () {
              // Handle logout logic
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('ชั้นเรียน'),
            onTap: () {
              // Handle navigation to home page
            },
          ),
          ListTile(
            leading: const Icon(Icons.calendar_today),
            title: const Text('ปฏิทิน'),
            onTap: () {
              // Handle navigation to settings page
            },
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('การแจ้งเตือน'),
            onTap: () {
              // Handle navigation to about page
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: const Text('การตั้งค่า'),
            onTap: () {
              // Handle logout logic
            },
          ),
        ],
      ),
    );
  }
}

class ClassroomContext extends StatelessWidget {
  final String classroomName;
  final String teacherName;
  final ImageProvider backgroundImage;

  const ClassroomContext({
    required this.classroomName,
    required this.teacherName,
    required this.backgroundImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: backgroundImage,
          fit: BoxFit.cover,
        ),
      ),
      // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: Text(
            classroomName,
            style: TextStyle(color: Colors.white),
          ),
        ),
        minVerticalPadding: 18,
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(teacherName, style: TextStyle(color: Colors.white)),
          ],
        ),
        onTap: () {
          // Add navigation or other actions here when the item is tapped.
        },
      ),
    );
  }
}
