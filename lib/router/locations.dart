import 'package:beamer/beamer.dart';
import 'package:carrotmarket_clone/screens/home_screen.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeLocation extends BeamLocation {
  @override
  List<BeamPage> buildPages(
      BuildContext context, RouteInformationSerializable state) {
    return [const BeamPage(child: HomeScreen(), key: ValueKey('home'))];
  }

  @override
  List<Pattern> get pathPatterns => ['/'];
}
