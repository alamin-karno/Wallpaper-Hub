import 'package:flutter/material.dart';

import '../navigation/navigation.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Wallpaper Hub',
      theme: ThemeData(primaryColor: Colors.white, useMaterial3: true),
      routerConfig: AppRouterConfig().router,
    );
  }
}
