import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hashtek_intern_assignment/firebase_options.dart';
import 'package:hashtek_intern_assignment/pages/signup_page.dart';
import 'package:hashtek_intern_assignment/utils/themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: SignUpPage(),
      theme: DarkTheme.getTheme(),
      debugShowCheckedModeBanner: false,
    );
  }
}
