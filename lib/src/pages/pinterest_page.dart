import 'package:flutter/material.dart';
import 'package:flutter_designs_app/widgets/pinterest_menu.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class PinterestPage extends StatelessWidget {
  const PinterestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (_) => _MenuProvider(),
        child: Stack(
          children: const [_PinterestGrid(), _PinterestMenuLocation()],
        ),
      ),
    );
  }
}

class _PinterestMenuLocation extends StatelessWidget {
  const _PinterestMenuLocation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final bool showMenu = Provider.of<_MenuProvider>(context).showMenu;

    return Positioned(bottom: 30, child: SizedBox(width: screenWidth, child: Align(child: PinterestMenu(showMenu: showMenu))));
  }
}

class _PinterestGrid extends StatefulWidget {
  const _PinterestGrid({super.key});

  @override
  State<_PinterestGrid> createState() => _PinterestGridState();
}

class _PinterestGridState extends State<_PinterestGrid> {
  final ScrollController scrollController = ScrollController();
  final List<int> items = List.generate(200, (index) => index);

  double previousScroll = 0;

  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.offset > previousScroll && scrollController.offset > 5) {
        Provider.of<_MenuProvider>(context, listen: false).showMenu = false;
      } else {
        Provider.of<_MenuProvider>(context, listen: false).showMenu = true;
      }

      previousScroll = scrollController.offset;
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.custom(
      controller: scrollController,
      gridDelegate: SliverQuiltedGridDelegate(
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        repeatPattern: QuiltedGridRepeatPattern.inverted,
        pattern: [
          const QuiltedGridTile(3, 2),
          const QuiltedGridTile(2, 2),
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
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(30)),
      height: index.isEven ? 200 : 300,
      child: Center(child: CircleAvatar(backgroundColor: Colors.white, child: Text('$index'))),
    );
  }
}

class _MenuProvider with ChangeNotifier {
  bool _showMenu = true;

  bool get showMenu => _showMenu;

  set showMenu(bool showMenu) {
    _showMenu = showMenu;
    notifyListeners();
  }
}
