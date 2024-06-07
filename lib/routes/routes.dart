
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet/routes/routes_name.dart';

import '../test/grid_test.dart';
import '../test/test.dart';
import '../test/test_2.dart';

class Routes {

  static Route<dynamic>  generateRoute(RouteSettings settings){

    switch(settings.name){

      // case RoutesName.menu:
      //   return CupertinoPageRoute(builder: (_) => MenuView(),);


      case RoutesName.test:
        return CupertinoPageRoute(builder: (_) => SuccessPage(),);

      case RoutesName.week1_489:
        return CupertinoPageRoute(builder: (_) => VangtiChai(),);

      case RoutesName.test_page_1:
        return CupertinoPageRoute(builder: (_) => MenuPage(),);



      default:
        return MaterialPageRoute(builder: (_){
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });

    }
  }
}