import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/water_provider.dart';
import 'router/app_router.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => WaterProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,

      routerConfig: AppRouter.router,

      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          scrolledUnderElevation: 0,
          surfaceTintColor: Colors.transparent,
        ),
      ),
    );
  }
}