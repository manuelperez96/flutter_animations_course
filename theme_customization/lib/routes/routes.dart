import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:theme_customization/pages/better_emergency_page.dart';
import 'package:theme_customization/pages/circular_arc_progress_indicator_page.dart';
import 'package:theme_customization/pages/fordward_reverse_rotator_page.dart';
import 'package:theme_customization/pages/onboarding_page.dart';
import 'package:theme_customization/pages/sliver_page.dart';
import 'package:theme_customization/pages/staggered_dual_list_page.dart';
import 'package:theme_customization/pages/wave_hader_page.dart';

final routes = <_Route>[
  _Route(
    name: 'CustomPainter',
    icon: Icons.brush_rounded,
    page: const WaveHeaderPage(),
  ),
  _Route(
    name: 'Animations',
    icon: Icons.animation_rounded,
    page: const ForwardReverseRotatorPage(),
  ),
  _Route(
    name: 'Circular Progress Indicator',
    icon: Icons.circle_rounded,
    page: const CircularArcProgressIndicatorPage(),
  ),
  _Route(
    name: 'Emergency Layout',
    icon: Icons.emergency_rounded,
    page: const BetterEmergencyPage(),
  ),
  _Route(
    name: 'Staggered dual list page',
    icon: FontAwesomeIcons.pinterest,
    page: const StaggaredDualListPage(),
  ),
  _Route(
    name: 'Onboarding',
    icon: FontAwesomeIcons.slideshare,
    page: const OnboardingPage(),
  ),
  _Route(
    name: 'Slivers',
    icon: FontAwesomeIcons.mobile,
    page: const SliverPage(),
  ),
];

class _Route {
  _Route({
    required this.name,
    required this.icon,
    required this.page,
  });
  final String name;
  final IconData icon;
  final Widget page;
}
