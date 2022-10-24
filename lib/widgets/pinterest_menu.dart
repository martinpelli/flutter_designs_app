import 'package:flutter/material.dart';

class PinterestButton {
  final void Function() onPressed;
  final IconData icon;

  PinterestButton({required this.onPressed, required this.icon});
}

class PinterestMenu extends StatelessWidget {
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

  PinterestMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return _PinterestmenuBackground(child: _MenuItems(items: items));
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
          boxShadow: [BoxShadow(color: Colors.black38, blurRadius: 10, spreadRadius: -5)]),
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
  const _PinterestMenu(this.index, this.item);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: item.onPressed,
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(item.icon, size: 25, color: Colors.blueGrey),
      ),
    );
  }
}
