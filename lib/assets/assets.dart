import 'package:flutter/cupertino.dart';

class Assets extends StatelessWidget {
  const Assets({super.key});

  @override
  Widget build(BuildContext context) {
    return GetCupertinoApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: Get.key,
      navigatorObservers: [GetObserver()],
      title: 'Tractian Assets Explorer',
    );
  }
}
