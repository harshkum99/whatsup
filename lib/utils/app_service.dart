import 'package:flutter/material.dart';

import '../main.dart';

class AppService {
  final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();
}

GlobalKey<NavigatorState> getNavigatorKey() {
  return locator<AppService>().navKey;
}

BuildContext? getContext() {
  return locator<AppService>().navKey.currentContext;
}
