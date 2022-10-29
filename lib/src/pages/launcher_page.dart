import 'package:flutter/material.dart';
import 'package:flutter_designs_app/src/providers/theme_changer_provider.dart';
import 'package:flutter_designs_app/src/routes/routes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LauncherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Designs')),
      body: const _OptionsList(),
      drawer: const _Main(),
    );
  }
}

class _OptionsList extends StatelessWidget {
  const _OptionsList({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChangerProvider>(context).currentTheme;

    return ListView.separated(
        itemBuilder: ((context, index) => ListTile(
              leading: FaIcon(
                pageRoutes[index].icon,
                color: appTheme.colorScheme.secondary,
              ),
              title: Text(pageRoutes[index].title),
              trailing: Icon(
                Icons.chevron_right,
                color: appTheme.colorScheme.secondary,
              ),
              onTap: (() {
                Navigator.push(context, MaterialPageRoute(builder: ((_) => pageRoutes[index].page)));
              }),
            )),
        separatorBuilder: ((context, index) => Divider(
              color: appTheme.primaryColorLight,
            )),
        itemCount: pageRoutes.length,
        physics: const BouncingScrollPhysics());
  }
}

class _Main extends StatelessWidget {
  const _Main({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChangerProvider>(context);
    return Drawer(
      child: Column(children: [
        SafeArea(
          child: SizedBox(
            width: double.infinity,
            height: 200,
            child: CircleAvatar(
              backgroundColor: appTheme.currentTheme.colorScheme.secondary,
              child: const Text('MP', style: TextStyle(fontSize: 50)),
            ),
          ),
        ),
        const Expanded(child: _OptionsList()),
        ListTile(
          leading: Icon(Icons.lightbulb_circle_outlined, color: appTheme.currentTheme.colorScheme.secondary),
          title: const Text('Dark Mode'),
          trailing: Switch.adaptive(
              value: appTheme.darkTheme, activeColor: appTheme.currentTheme.colorScheme.secondary, onChanged: (value) => appTheme.darkTheme = value),
        ),
        SafeArea(
          bottom: true,
          top: false,
          left: false,
          right: false,
          child: ListTile(
            leading: Icon(Icons.add_to_home_screen, color: appTheme.currentTheme.colorScheme.secondary),
            title: const Text('Custom Theme'),
            trailing: Switch.adaptive(
                value: appTheme.customTheme,
                activeColor: appTheme.currentTheme.primaryColorLight,
                onChanged: (value) => appTheme.customTheme = value),
          ),
        )
      ]),
    );
  }
}
