import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'providers/water_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => WaterProvider(),
      child: const MyApp(),
    ),
  );
}