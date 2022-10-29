import 'package:flutter/material.dart';
import 'package:flutter_designs_app/src/pages/slideshow_page.dart';
import 'package:flutter_designs_app/src/pages/animations_page.dart';
import 'package:flutter_designs_app/src/pages/circular_graphics_page.dart';
import 'package:flutter_designs_app/src/pages/emergency_page.dart';
import 'package:flutter_designs_app/src/pages/headers_page.dart';
import 'package:flutter_designs_app/src/pages/pinterest_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../pages/sliver_page.dart';

final pageRoutes = <_Route>[
  _Route(FontAwesomeIcons.slideshare, 'Slideshow', SlideshowPage()),
  _Route(FontAwesomeIcons.truckMedical, 'Emergencia', EmergencyPage()),
  _Route(FontAwesomeIcons.heading, 'Headers', HeadersPage()),
  _Route(FontAwesomeIcons.peopleCarryBox, 'Animations', AnimationsPage()),
  _Route(FontAwesomeIcons.circleNotch, 'Progress Bar', CircularGraphicsPage()),
  _Route(FontAwesomeIcons.pinterest, 'Pinterest', PinterestPage()),
  _Route(FontAwesomeIcons.mobile, 'Slivers', SliverPage()),
];

class _Route {
  final IconData icon;
  final String title;
  final Widget page;

  _Route(this.icon, this.title, this.page);
}
