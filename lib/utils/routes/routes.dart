import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/view/home_screen.dart';

import '../../view/login_view.dart';

class Routes
{
  static Route<dynamic> generateRoute(RouteSettings settings)
  {
    switch(settings.name)
    {
      case RoutesName.login:
        return MaterialPageRoute(builder: (BuildContext context) => const LoginView());

      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context) => HomeScreen());

      default:
        return MaterialPageRoute(builder: (_){
          return const Scaffold(
            body: Center(
              child: Text("No route defined"),
            ),
          );
        });
    }
  }
}