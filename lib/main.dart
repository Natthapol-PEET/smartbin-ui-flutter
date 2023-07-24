import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:smartbin_ui_flutter/bindings/root_binding.dart';
import 'package:smartbin_ui_flutter/core/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Smart bin GUI Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      initialBinding: RootBinding(),
      initialRoute: RoutePath.loginKuWin,
      getPages: AppRout.router,
    );
  }
}
