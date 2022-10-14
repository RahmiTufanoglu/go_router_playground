import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_playground/apps_flyer_config.dart';
import 'package:go_router_playground/router.dart';

void main() {
  appsflyerSdk.initSdk(
    // Set a listener for the GCD response, it is also the callback used for the Legacy deferred deeplinking
    registerConversionDataCallback: true,
    // Set a listener for the Legacy direct deeplinking response
    registerOnAppOpenAttributionCallback: true,
    // Set a listener for the UDL response
    registerOnDeepLinkingCallback: true,
  );

  GoRouter.setUrlPathStrategy(UrlPathStrategy.path);

  runApp(const MainApp());
}

@immutable
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      // routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
    );
  }
}
