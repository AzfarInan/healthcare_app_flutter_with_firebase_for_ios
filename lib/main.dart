import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:healthcare_flutter_firebase_ios_app/src/config/route.dart';
import 'package:healthcare_flutter_firebase_ios_app/src/theme/theme.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Health Care',
      theme: AppTheme.lightTheme,
      routes: Routes.getRoute(),
      onGenerateRoute: (settings) => Routes.onGenerateRoute(settings),
      debugShowCheckedModeBanner: false,
      initialRoute: "SplashPage",
    );
  }
}