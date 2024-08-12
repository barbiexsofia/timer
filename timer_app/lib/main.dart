import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:timer_app/progressIndicator/ui/timer_page.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Countdown app",
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: TimerPage(),
    );
  }
}
