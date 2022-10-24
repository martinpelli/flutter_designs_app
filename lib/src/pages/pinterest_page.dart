import 'package:flutter/material.dart';
import 'package:flutter_designs_app/widgets/pinterest_menu.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PinterestPage extends StatelessWidget {
  const PinterestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PinterestMenu(),
    );
  }
}

class _PinterestGrid extends StatelessWidget {
  const _PinterestGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final List<int> items = List.generate(200, (index) => index);

    return GridView.custom(
      gridDelegate: SliverQuiltedGridDelegate(
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        repeatPattern: QuiltedGridRepeatPattern.inverted,
        pattern: [
          QuiltedGridTile(3, 2),
          QuiltedGridTile(2, 2),
        ],
      ),
      childrenDelegate: SliverChildBuilderDelegate(
        childCount: items.length,
        (context, index) => _PinterestItem(index: index),
      ),
    );
  }
}

class _PinterestItem extends StatelessWidget {
  final int index;

  const _PinterestItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(30)),
      child: Center(child: CircleAvatar(backgroundColor: Colors.white, child: Text('$index'))),
      height: index.isEven ? 200 : 300,
    );
  }
}
