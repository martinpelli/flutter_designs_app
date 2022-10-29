import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_changer_provider.dart';

class SliverPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [MainScroll(), _ButtonNewList()],
    ));
  }
}

class _ButtonNewList extends StatelessWidget {
  const _ButtonNewList({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final appTheme = Provider.of<ThemeChangerProvider>(context);
    return Positioned(
      bottom: -10,
      right: 0,
      child: ButtonTheme(
        minWidth: size.width * 0.9,
        child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            shape: MaterialStateProperty.all(const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(50)))),
            backgroundColor: MaterialStateProperty.all(appTheme.darkTheme ? Colors.grey : const Color(0xffED6762)),
          ),
          child: Text('CREATE NEW LIST',
              style: TextStyle(color: appTheme.currentTheme.scaffoldBackgroundColor, fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 3)),
        ),
      ),
    );
  }
}

class MainScroll extends StatelessWidget {
  final items = [
    const _ListCardItem('Orange', Color(0xffF08F66)),
    const _ListCardItem('Family', Color(0xffF2A38A)),
    const _ListCardItem('Subscriptions', Color(0xffF7CDD5)),
    const _ListCardItem('Books', Color(0xffFCEBAF)),
    const _ListCardItem('Orange', Color(0xffF08F66)),
    const _ListCardItem('Family', Color(0xffF2A38A)),
    const _ListCardItem('Subscriptions', Color(0xffF7CDD5)),
    const _ListCardItem('Books', Color(0xffFCEBAF)),
  ];

  MainScroll({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
/*         SliverAppBar(
          elevation: 0,
          floating: true,
          backgroundColor: Colors.red,
          title: Text('hola'),
        ), */

        SliverPersistentHeader(floating: true, delegate: _SliverCustomHeaderDelegate(minHeight: 170, maxHeight: 200, child: _Title())),
        SliverList(delegate: SliverChildListDelegate([...items, const SizedBox(height: 100)]))
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverCustomHeaderDelegate({required this.minHeight, required this.maxHeight, required this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant _SliverCustomHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight || minHeight != oldDelegate.minHeight || child != oldDelegate.child;
  }
}

class _Title extends StatelessWidget {
  const _Title({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChangerProvider>(context);
    return Container(
      color: appTheme.currentTheme.scaffoldBackgroundColor,
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          const SizedBox(height: 30),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Text('New', style: TextStyle(color: appTheme.darkTheme ? Colors.grey : const Color(0xff532128), fontSize: 50))),
          Stack(
            children: [
              const SizedBox(width: 100),
              Positioned(
                bottom: 8,
                child: Container(
                  width: 150,
                  height: 8,
                  decoration: BoxDecoration(color: appTheme.darkTheme ? Colors.grey : const Color(0xffF7CDD5)),
                ),
              ),
              const Text("List", style: TextStyle(color: Color(0xffD93A30), fontSize: 50, fontWeight: FontWeight.bold)),
            ],
          )
        ],
      ),
    );
  }
}

class _ListCards extends StatelessWidget {
  final items = [
    const _ListCardItem('Orange', Color(0xffF08F66)),
    const _ListCardItem('Family', Color(0xffF2A38A)),
    const _ListCardItem('Subscriptions', Color(0xffF7CDD5)),
    const _ListCardItem('Books', Color(0xffFCEBAF)),
    const _ListCardItem('Orange', Color(0xffF08F66)),
    const _ListCardItem('Family', Color(0xffF2A38A)),
    const _ListCardItem('Subscriptions', Color(0xffF7CDD5)),
    const _ListCardItem('Books', Color(0xffFCEBAF)),
  ];

  _ListCards({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: items.length, itemBuilder: ((_, index) => items[index]));
  }
}

class _ListCardItem extends StatelessWidget {
  final String title;
  final Color color;

  const _ListCardItem(
    this.title,
    this.color, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      height: 130,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(30)),
      child: Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
    );
  }
}
