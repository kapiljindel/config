import 'package:flutter/material.dart';
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
              ElevatedButton(onPressed: () => changeAppIcon('.Icon1'), child: Text("Icon 1")),
              ElevatedButton(onPressed: () => changeAppIcon('.Icon2'), child: Text("Icon 2")),
              ElevatedButton(onPressed: () => changeAppIcon('.Icon3'), child: Text("Icon 3")),
              ElevatedButton(onPressed: () => changeAppIcon('.Icon4'), child: Text("Icon 4")),
            ],
          ),
        ),
      ),
    );
  }
}
