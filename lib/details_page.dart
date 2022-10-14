import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router_playground/apps_flyer_config.dart';

@immutable
class DetailsPage extends StatefulWidget {
  static const routeName = 'details';

  const DetailsPage({super.key});

  @override
  State<StatefulWidget> createState() => DetailsPageState();
}

class DetailsPageState extends State<DetailsPage> {
  Future<void> logEvent(String eventName, Map? eventValues) async {
    bool? result;
    try {
      result = await appsflyerSdk.logEvent(eventName, eventValues);
    } on Exception catch (e) {
      log(e.toString());
    }

    log('Result logEvent: $result');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => logEvent('af_click', {'foo': true}),
              child: const Text('Click Event'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => logEvent('af_press', {'boo': 42}),
              child: const Text('Press Event'),
            ),
          ],
        ),
      ),
    );
  }
}
