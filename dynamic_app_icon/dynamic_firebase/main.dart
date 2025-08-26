import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Firebase init
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const platform = MethodChannel('com.example.dynamic_icon');

  @override
  void initState() {
    super.initState();
    _fetchIconFromFirebaseAndApply();
  }

  Future<void> _fetchIconFromFirebaseAndApply() async {
    try {
      final doc =
          await FirebaseFirestore.instance
              .collection('settings')
              .doc('default_config')
              .get();

      final icon = doc.data()?['app_icon'] as String?;
      if (icon != null && icon.startsWith('.')) {
        await platform.invokeMethod('changeIcon', {'icon': icon});
      }
    } catch (e) {
      print("Error changing icon: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Flutter App",
      home: Scaffold(
        appBar: AppBar(title: Text("Home")),
        body: Center(child: Text("Welcome to your Flutter App 👋")),
      ),
    );
  }
}



/*import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const platform = MethodChannel('com.example.dynamic_icon');

  void changeAppIcon(String iconName) async {
    try {
      await platform.invokeMethod('changeIcon', {'icon': iconName});
    } catch (e) {
      print('Error changing icon: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Dynamic Icon App')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => changeAppIcon('.Icon1'),
                child: Text("Icon 1"),
              ),
              ElevatedButton(
                onPressed: () => changeAppIcon('.Icon2'),
                child: Text("Icon 2"),
              ),
              ElevatedButton(
                onPressed: () => changeAppIcon('.Icon3'),
                child: Text("Icon 3"),
              ),
              ElevatedButton(
                onPressed: () => changeAppIcon('.Icon4'),
                child: Text("Icon 4"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/
