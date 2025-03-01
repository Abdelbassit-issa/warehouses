import 'package:flutter/material.dart';

import 'package:warehouses/root.dart';
import 'package:warehouses/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppRouter.initializeRouter();
  runApp(const MainWidgetx());
}
