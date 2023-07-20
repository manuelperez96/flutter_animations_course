import 'package:emergency_layout/widget/big_list_item.dart';
import 'package:emergency_layout/widget/fade_in_left.dart';
import 'package:emergency_layout/widget/rounded_right_header.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const _awesomeIcons = <IconData>[
  FontAwesomeIcons.leaf,
  FontAwesomeIcons.dragon,
  FontAwesomeIcons.userNinja,
  FontAwesomeIcons.fish,
];

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          const _TopHeader(),
          Expanded(
            child: ListView(
              itemExtent: 100,
              children: List.generate(20, _buildMenuItem),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(int index) {
    final color = Colors.primaries[index % Colors.primaries.length];
    final icon = _awesomeIcons[index % _awesomeIcons.length];

    return FadeInLeft(
      child: BigListItem(
        backgroundColor: color,
        mainIcon: FaIcon(
          icon,
          size: 48,
          color: Colors.white,
        ),
        backgroundIcon: FaIcon(
          icon,
          size: 140,
          color: Colors.white,
        ),
        title: 'Coche roto',
      ),
    );
  }
}

class _TopHeader extends StatelessWidget {
  const _TopHeader();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorText = Colors.white.withOpacity(.7);

    return RoundedRightHeader(
      child: Stack(
        children: <Widget>[
          Positioned(
            top: -70,
            left: -70,
            child: FaIcon(
              FontAwesomeIcons.plus,
              size: 250,
              color: Colors.white.withOpacity(.2),
            ),
          ),
          Align(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'Has solicitado',
                  style: textTheme.bodyLarge?.copyWith(
                    color: colorText,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Asistencia médica',
                  style: textTheme.bodyLarge?.copyWith(
                    color: colorText,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 24),
                FaIcon(
                  FontAwesomeIcons.plus,
                  size: 90,
                  color: Colors.white.withOpacity(.9),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
