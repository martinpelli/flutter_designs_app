import 'package:flutter/material.dart';

import 'package:flutter_designs_app/src/pages/launcher_page.dart';
import 'package:flutter_designs_app/src/providers/theme_changer_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(ChangeNotifierProvider(create: ((context) => ThemeChangerProvider(1)), child: const MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: Provider.of<ThemeChangerProvider>(context).currentTheme,
        debugShowCheckedModeBanner: false,
        title: 'Designs App',
        home: LauncherPage());
  }
}
