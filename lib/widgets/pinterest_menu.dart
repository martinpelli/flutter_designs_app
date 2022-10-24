import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final void Function() onPressed;
  final IconData icon;

  PinterestButton({required this.onPressed, required this.icon});
}

class PinterestMenu extends StatelessWidget {
  final bool showMenu;

  PinterestMenu({super.key, this.showMenu = true});

  final List<PinterestButton> items = [
    PinterestButton(
        onPressed: () {
          print("Icon pie chart");
        },
        icon: Icons.pie_chart),
    PinterestButton(
        onPressed: () {
          print("Icon search");
        },
        icon: Icons.search),
    PinterestButton(
        onPressed: () {
          print("Icon notifications");
        },
        icon: Icons.notifications),
    PinterestButton(
        onPressed: () {
          print("Icon user");
        },
        icon: Icons.supervised_user_circle)
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => _MenuProvider(),
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 200),
          opacity: showMenu ? 1 : 0,
          child: _PinterestmenuBackground(child: _MenuItems(items: items)),
        ));
  }
}

class _PinterestmenuBackground extends StatelessWidget {
  final Widget child;

  const _PinterestmenuBackground({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 60,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
          boxShadow: const [BoxShadow(color: Colors.black38, blurRadius: 10, spreadRadius: -5)]),
      child: child,
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton> items;

  const _MenuItems({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(items.length, (index) => _PinterestMenu(index, items[index])),
    );
  }
}

class _PinterestMenu extends StatelessWidget {
  final int index;
  final PinterestButton item;

  final Color activeColor = Colors.black;
  final Color inactiveColor = Colors.blueGrey;

  const _PinterestMenu(this.index, this.item);

  @override
  Widget build(BuildContext context) {
    final selectedItem = Provider.of<_MenuProvider>(context).selectedItem;

    return GestureDetector(
      onTap: () {
        Provider.of<_MenuProvider>(context, listen: false).selectedItem = index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(item.icon, size: (selectedItem == index) ? 35 : 25, color: (selectedItem == index) ? Colors.black : Colors.blueGrey),
      ),
    );
  }
}

class _MenuProvider with ChangeNotifier {
  int _selectedItem = 0;

  int get selectedItem => _selectedItem;

  set selectedItem(int index) {
    _selectedItem = index;
    notifyListeners();
  }
}
