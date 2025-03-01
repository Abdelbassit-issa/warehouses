

import 'package:flutter/material.dart';
import 'package:warehouses/router.dart';

class MainWidgetx extends StatefulWidget {
  const MainWidgetx({super.key});

  @override
  State<MainWidgetx> createState() => _MainWidgetxState();
}

class _MainWidgetxState extends State<MainWidgetx> {

  @override
  Widget build(BuildContext context) {
    return   MaterialApp.router(
          routerConfig: AppRouter.goRouter,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
        );
      
  }
}