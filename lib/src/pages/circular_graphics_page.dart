import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/radial_progress.dart';
import '../providers/theme_changer_provider.dart';

class CircularGraphicsPage extends StatefulWidget {
  const CircularGraphicsPage({super.key});

  @override
  State<CircularGraphicsPage> createState() => _CircularGraphicsPageState();
}

class _CircularGraphicsPageState extends State<CircularGraphicsPage> {
  double percent = 0.0;

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChangerProvider>(context).currentTheme;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            percent += 10;
            if (percent > 100) {
              percent = 0;
            }
          });
        },
        child: const Icon(Icons.refresh),
      ),
      body: Center(
          child: Container(
        width: 300,
        height: 300,
        child: RadialProgress(
          percent: percent,
          strokeColor: Colors.pink,
          backColor: appTheme.textTheme.bodyText1!.color!,
          strokeWidth: 15,
          backWidth: 10,
        ),
      )),
    );
  }
}
