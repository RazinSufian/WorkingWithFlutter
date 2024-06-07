import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pet/routes/routes.dart';
import 'package:pet/routes/routes_name.dart';

void main() {
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Always portrait mode orientation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent, // optional
    ));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      initialRoute: RoutesName.test,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
