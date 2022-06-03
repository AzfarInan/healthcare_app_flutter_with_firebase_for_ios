import 'package:flutter/material.dart';
import 'package:healthcare_flutter_firebase_ios_app/src/model/dactor_model.dart';
import 'package:healthcare_flutter_firebase_ios_app/src/pages/home_page.dart';
import 'package:healthcare_flutter_firebase_ios_app/src/pages/register_page.dart';
import 'package:healthcare_flutter_firebase_ios_app/src/pages/splash_page.dart';


import '../pages/detail_page.dart';
import '../pages/login_page.dart';
import '../widgets/coustom_route.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoute() {
    return <String, WidgetBuilder>{
      '/': (_) => SplashPage(),
      '/LoginPage': (_) => LoginPage(),
      '/RegisterPage': (_) => RegisterPage(),
      '/HomePage': (_) => HomePage(),
    };
  }

  static Route? onGenerateRoute(RouteSettings settings) {
    final List<String>? pathElements = settings.name?.split('/');
    if (pathElements![0] != '' || pathElements.length == 1) {
      return null;
    }
    switch (pathElements[1]) {
      case "DetailPage":
        return MaterialPageRoute(
            builder: (BuildContext context) => DetailPage(model: settings.arguments as DoctorModel,)
          );
    }
    return null;
  }
}

