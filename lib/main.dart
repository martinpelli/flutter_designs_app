import 'package:flutter/material.dart';
import 'package:flutter_designs_app/src/providers/layout_provider.dart';

import 'package:provider/provider.dart';

import 'package:flutter_designs_app/src/providers/theme_changer_provider.dart';

import 'package:flutter_designs_app/src/pages/launcher_page.dart';
import 'package:flutter_designs_app/src/pages/launcher_tablet_page.dart';

void main() => runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: ((_) => ThemeChangerProvider(1))), ChangeNotifierProvider(create: ((_) => LayoutProvider()))],
    child: const MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<ThemeChangerProvider>(context).currentTheme,
      debugShowCheckedModeBanner: false,
      title: 'Designs App',
      home: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          final screenSize = MediaQuery.of(context).size;

          if (screenSize.width > 500) {
            return LauncherTabletPage();
          }

          return LauncherPage();
        },
      ),
    );
  }
}
