// import 'package:clone_app_tiktok/BuildApp/FooterApp.dart';
// import 'package:clone_app_tiktok/Page/AllPage.dart';

import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../provider/GlobalState.dart';
import 'package:clone_app_tiktok/Route/App_Route.dart';

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRoute.router,
    );
  }
}
