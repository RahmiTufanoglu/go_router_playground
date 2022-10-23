import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_playground/app_error_widget.dart';
import 'package:go_router_playground/home_page.dart';
import 'package:go_router_playground/login_provider.dart';
import 'package:go_router_playground/router/router.dart';
import 'package:go_router_playground/service_locator.dart';
import 'package:provider/provider.dart';

void main() {
  //appsflyerSdk.initSdk(
  //  // Set a listener for the GCD response, it is also the callback used for the Legacy deferred deeplinking
  //  registerConversionDataCallback: true,
  //  // Set a listener for the Legacy direct deeplinking response
  //  registerOnAppOpenAttributionCallback: true,
  //  // Set a listener for the UDL response
  //  registerOnDeepLinkingCallback: true,
  //);

  //GoRouter.setUrlPathStrategy(UrlPathStrategy.path);

  setupLocator();

  runApp(
    FutureBuilder<void>(
      future: serviceLocator.allReady(),
      builder: (_, snapshot) {
        return App(() {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const SizedBox.shrink();
            case ConnectionState.waiting:
            case ConnectionState.active:
              return const CupertinoActivityIndicator();
            case ConnectionState.done:
              if (snapshot.hasError) {
                return const SizedBox.shrink();
              }
              if (snapshot.hasData) {
                return const HomePage();
              }
              throw Exception();
          }
        }());
      },
    ),
  );
}

@immutable
class App extends StatelessWidget {
  const App(this.child, {super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
      ],
      child: MaterialApp.router(
        title: 'Go Router Playground',
        routerDelegate: router.routerDelegate,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.indigo),
        builder: (_, widget) {
          Widget error = const AppErrorWidget();
          if (widget is Scaffold || widget is Navigator) {
            error = Scaffold(body: Center(child: error));
          }
          ErrorWidget.builder = (_) => error;
          if (widget != null) return widget;
          throw 'widget is null';
        },
      ),
    );
  }
}
