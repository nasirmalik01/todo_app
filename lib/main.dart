import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/data/local/my_hive.dart';
import 'package:todo_app/view_model/todo_provider.dart';
import 'view/screens/todo_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await MyHive.init();

  runApp(
      MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ToDoProvider()),
      ],
        child: const MyApp(),
      ),);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDo App',
      home: ToDoScreen(),
    );
  }
}
