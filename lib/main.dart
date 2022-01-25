import 'package:beamer/beamer.dart';
import 'package:carrotmarket_clone/router/locations.dart';
import 'package:carrotmarket_clone/screens/start_screen.dart';
import 'package:carrotmarket_clone/screens/spash_screen.dart';
import 'package:carrotmarket_clone/utils/scroll.dart';
import 'package:flutter/material.dart';
import 'package:carrotmarket_clone/utils/logger.dart';

final _routerDelegate = BeamerDelegate(guards: [
  BeamGuard(
      pathPatterns: ['/'],
      check: (context, location) {
        return false;
      },
      showPage: BeamPage(child: StartScreen()))
], locationBuilder: BeamerLocationBuilder(beamLocations: [HomeLocation()]));

void main() {
  logger.d('My first log by logger!!');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(const Duration(seconds: 3), () => 100),
        builder: (context, snapshot) {
          return AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: _splashLoadingWidget(snapshot));
        });
  }

  StatelessWidget _splashLoadingWidget(AsyncSnapshot<Object?> snapshot) {
    if (snapshot.hasError) {
      debugPrint('error occur while loading.');
      return const Text('Error occur');
    } else if (snapshot.hasData) {
      return CarrotApp();
    } else {
      return const SplashScreen();
    }
  }
}

class CarrotApp extends StatelessWidget {
  const CarrotApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
          primarySwatch: Colors.orange,
          fontFamily: 'Jalnan',
          hintColor: Colors.grey[350],
          textTheme: TextTheme(
            button: TextStyle(color: Colors.white),
          ),
          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
            backgroundColor: Color(0xffef8449),
            primary: Colors.white,
            minimumSize: Size(48, 48),
          )),
          appBarTheme: AppBarTheme(
              elevation: 2,
              backgroundColor: Colors.white,
              toolbarTextStyle: TextStyle(color: Colors.black87))),
      scrollBehavior: AppScrollBehavior(), //마우스 스와이프
      routeInformationParser: BeamerParser(),
      routerDelegate: _routerDelegate,
    );
  }
}
