import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:news_letter/news_letter/presentation_layer/screens/main_screen.dart';
import 'package:sizer/sizer.dart';

import 'core/services/dep_injection.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  ServiceLocator().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
          builder: (context, orientation, deviceType) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(

                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home: const MainScreen(),
            );
          }
      );
  }
}



