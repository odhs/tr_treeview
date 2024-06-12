import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tr_treeview/assets/core/design_system/tractian_colors.dart';
import 'package:tr_treeview/assets/core/routes.dart';

class Assets extends StatelessWidget {
  const Assets({super.key});

  @override
  Widget build(BuildContext context) {
    return GetCupertinoApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.home,
      getPages: routes,
      navigatorKey: Get.key,
      navigatorObservers: [GetObserver()],
      title: 'Tractian Assets Explorer',
      theme: CupertinoThemeData(
        brightness: Brightness.light,
        textTheme: CupertinoTextThemeData(
          primaryColor: TractianColors.neutralColorsWhite,
        ),
      ),
    );
  }
}
